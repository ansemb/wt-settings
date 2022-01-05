# Powershell

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# Set the color for Prediction (auto-suggestion)
Set-PSReadLineOption -Colors @{ InlinePrediction = '#58657a'}
#Set-PSReadlineOption -Colors @{Prediction = 'DarkGreen' }


# starship
Invoke-Expression (&starship init powershell)


# custom functions

function dotfiles { git --git-dir="$HOME\.dotfiles" --work-tree="$HOME" @Args }
