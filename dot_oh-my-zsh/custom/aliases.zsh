alias aliases="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias exports="nvim ~/.oh-my-zsh/custom/exports.zsh"

# Hard Clear
alias hclear="printf '\033[2J\033[3J\033[1;1H'"
alias clearh="printf '\033[2J\033[3J\033[1;1H'"

# Dev
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
alias pi="open /Applications/Picotron.app/Contents/MacOS/picotron"
alias python="/usr/bin/python3"

# Utilities
alias t="htop"
alias vi="nvim"
alias vim="nvim"
alias ls="lsd"
alias neofetch="neowofetch"
alias disc="ncdu /"
alias map="ncdu"
alias lg="lazygit"

# Kitty
alias s="kitten ssh"
function upload(){
    kitten transfer --direction=upload "$@" ./
}
function download(){
    kitten transfer --direction=download "$@" ./
}

# Music Downloading
alias am="gamdl"
alias yta="yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output \"~/Downloads/%(playlist)s/%(title)s.%(ext)s\" --yes-playlist --embed-metadata"
alias ytb="yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output \"~/%(playlist)s/%(title)s.%(ext)s\" --yes-playlist --embed-metadata"
alias b="beet im -C -w"
alias music="rmpc"
alias mu="rmpc"

# Waveform Background
alias ca="kitten panel --edge=background -c ~/.config/kitty/kitty-background.conf --single-instance --listen-on=unix:/tmp/kittybg cava & mu"
alias blur="kitten @ --to=unix:/tmp/kittybg set-background-opacity --toggle 0"
