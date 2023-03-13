format="""
$directory$kubernetes$git_branch$git_state$git_status
$jobs$character\
"""

add_newline = true

[character]
success_symbol = "[🌸 ](bold blue)"
error_symbol = "[🥀 ](bold red)"

[directory]
style = "blue"

[git_branch]
style = "bold yellow"

[git_status]
format = "[($staged)](yellow)[($untracked)](blue)[($deleted)](red)[($modified)](green) "
conflicted = "😳 "
untracked  = "●"
modified   = "●"
staged     = "●"
deleted    = "●"

[jobs]
symbol = "●"
style = "blue"
format = "[$number$symbol]($style) "

[kubernetes]
disabled = false
symbol = "☸ "
format = '($symbol)[$context](bold green) 🦋  [$namespace](bold yellow)'
