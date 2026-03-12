alias aliases="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias exports="nvim ~/.oh-my-zsh/custom/exports.zsh"

# Hard Clear
alias cls="printf '\033[2J\033[3J\033[1;1H'"

# Dev
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
alias pt="/Applications/Picotron.app/Contents/MacOS/picotron"
alias python="python3"
# alias python="/usr/bin/python3"

# Utilities
alias t="htop"
alias vi="nvim"
alias ls="lsd"
alias neofetch="neowofetch"
alias disc="ncdu /"
alias map="ncdu"
alias lg="lazygit"
alias send="scp"

# Kitty
alias s="kitten ssh"

# Music Downloading
alias am="gamdl --cookies-path='/Users/isbell/.config/gamdl/cookies.txt' --output-path '/Users/isbell/Music/Music/Media.localized/Music' --no-synced-lyrics"
alias yta="yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output \"~/Downloads/%(playlist)s/%(title)s.%(ext)s\" --yes-playlist --embed-metadata"
alias ytb="yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output \"~/%(playlist)s/%(title)s.%(ext)s\" --yes-playlist --embed-metadata"
alias b="beet im -C -w"
alias music="rmpc"
alias mu="rmpc"

# Waveform Background
alias ca="kitten panel --edge=background -c ~/.config/kitty/kitty-background.conf --single-instance --listen-on=unix:/tmp/kittybg cava & mu"
alias blur="kitten @ --to=unix:/tmp/kittybg set-background-opacity --toggle 0"

# School
alias omp="/opt/homebrew/opt/llvm/bin/clang -g -Wall -fopenmp"
