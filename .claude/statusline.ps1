# Claude Code status line — Catppuccin Mocha palette
# Reads JSON session data from stdin, prints formatted status line.

$ErrorActionPreference = 'SilentlyContinue'

$Data = $input | Out-String
if (-not $Data) { exit 0 }
$json = $Data | ConvertFrom-Json

# --- Catppuccin Mocha true-color helpers ---
function c($r, $g, $b) { "`e[38;2;${r};${g};${b}m" }
$RST    = "`e[0m"
$DIM    = "`e[2m"

$MAUVE   = c 203 166 247
$BLUE    = c 137 180 250
$GREEN   = c 166 227 161
$PEACH   = c 250 179 135
$YELLOW  = c 249 226 175
$TEAL    = c 148 226 213
$SUBTEXT = c 166 173 200
$SURFACE = c 88 91 112
$RED     = c 243 139 168

$SEP = "${DIM}${SURFACE} `u{2502} ${RST}"

# --- Extract fields ---
$model      = $json.model.display_name
$cost       = $json.cost.total_cost_usd
$durationMs = $json.cost.total_duration_ms
$ctxPct     = $json.context_window.used_percentage
$inputTok   = $json.context_window.total_input_tokens
$outputTok  = $json.context_window.total_output_tokens

# --- Repo / branch ---
$repoBranch = ''
$isGit = git rev-parse --is-inside-work-tree 2>$null
if ($isGit -eq 'true') {
    $repo   = Split-Path -Leaf (git rev-parse --show-toplevel 2>$null)
    $branch = git symbolic-ref --short HEAD 2>$null
    if (-not $branch) { $branch = git rev-parse --short HEAD 2>$null }
    if ($repo -and $branch) {
        $repoBranch = "${BLUE}${repo}${RST}${DIM}:${RST}${MAUVE}${branch}${RST}"
    }
}

# --- Model ---
$modelStr = ''
if ($model) { $modelStr = "${GREEN}${model}${RST}" }

# --- Cost ---
$costStr = ''
if ($null -ne $cost) {
    $costStr = "${PEACH}`$" + ('{0:F4}' -f [double]$cost) + "${RST}"
}

# --- Duration ---
$durationStr = ''
if ($null -ne $durationMs) {
    $totalS = [math]::Floor([double]$durationMs / 1000)
    $mins = [math]::Floor($totalS / 60)
    $secs = $totalS % 60
    if ($mins -gt 0) {
        $durationStr = "${YELLOW}${mins}m ${secs}s${RST}"
    } else {
        $durationStr = "${YELLOW}${secs}s${RST}"
    }
}

# --- Tokens / context ---
$ctxStr = ''
if ($null -ne $ctxPct) {
    $tokLabel = ''
    if ($null -ne $inputTok -and $null -ne $outputTok) {
        $totalTok = [int]$inputTok + [int]$outputTok
        if ($totalTok -ge 1000) {
            $tokLabel = ('{0:F1}k' -f ($totalTok / 1000)) + '  '
        } else {
            $tokLabel = "$totalTok  "
        }
    }
    $pctInt = [int]$ctxPct
    if ($pctInt -ge 80) { $pctColor = $RED }
    elseif ($pctInt -ge 60) { $pctColor = $PEACH }
    else { $pctColor = $TEAL }
    $ctxStr = "${SUBTEXT}${tokLabel}${pctColor}${pctInt}%${RST}"
}

# --- Assemble ---
$parts = @()
if ($repoBranch)  { $parts += $repoBranch }
if ($modelStr)    { $parts += $modelStr }
if ($costStr)     { $parts += $costStr }
if ($durationStr) { $parts += $durationStr }
if ($ctxStr)      { $parts += $ctxStr }

if ($parts.Count -eq 0) { exit 0 }

Write-Host -NoNewline ($parts -join $SEP)
