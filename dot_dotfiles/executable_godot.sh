#!/usr/bin/env bash

# CHANGE IF NEEDED:
term_exec="kitty"
nvim_exec="nvim"
server_path="$HOME/.cache/nvim/godot-server.pipe"
server_startup_delay=0.1

start_server() {
  "$term_exec" -e "$nvim_exec" --listen "$server_path"
}

open_file_in_server() {
  filename=$(printf %q "$1")
  "$term_exec" -e "$nvim_exec" --server "$server_path" --remote-send "<C-\><C-n>:n $filename<CR>:call cursor($2)<CR>"
}

if ! [ -e "$server_path" ]; then
  start_server &
  sleep $server_startup_delay
  open_file_in_server "$1" "$2"
else
  open_file_in_server "$1" "$2"
fi
