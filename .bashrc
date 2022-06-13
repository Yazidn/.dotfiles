#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/home/$USER/.local/bin:$PATH"

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lha --color=auto --group-directories-first'
alias ..='cd ..'
alias fm="nnn -cod"

alias ds="yt-dlp --audio-format best -x"
alias dsl="yt-dlp --audio-format best -x -a"

alias aur="baph -i" # Not working anymore, problem is with baph.
alias rec="ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac"

alias vi="vim"
alias j="jrnl"
alias jt="jrnl -today"

alias gh="history|grep"
alias gp="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

PS1='[\u@\h \W]\$ '

fd() {
	cd "$(find -type d | fzf)"	
}

op() {
	xdg-open "$(find -type f | fzf)"	
}

wtfis() {
    curl "https://cheat.sh/$1"
}

fcount() {
	ls $1 | wc -l
}

bind TAB:menu-complete
bind '"\e[Z":menu-complete-backward'
bind "set completion-ignore-case on"

#echo -e '\n' && pfetch && echo -e '\n'

# fm() {
#     pcmanfm &
#     disown
# }

# bind '"\eOS":"fm\n"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/platform-tools
