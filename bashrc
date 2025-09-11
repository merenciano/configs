#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias reloadwaybar='pkill waybar && hyprctl dispatch exec waybar'
alias reloadhyprpaper='pkill hyprpaper && hyprctl dispatch exec hyprpaper'

# ENV VARS
PROMPT_PRIMARY_COLOR="\[[38;2;148;227;213m\]"
PROMPT_SECONDARY_COLOR="\[[38;2;203;166;247m\]"

#PS1='[\u@\h \W]\$ '    default
PS1="${PROMPT_SECONDARY_COLOR} > ${PROMPT_PRIMARY_COLOR}lluc${PROMPT_SECONDARY_COLOR}: ${PROMPT_PRIMARY_COLOR}\w${PROMPT_SECONDARY_COLOR} \$ \[[0m\]"

PATH=${PATH}:~/app/bin

