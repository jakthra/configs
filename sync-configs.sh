#!/bin/bash
set -e

echo "Copying oh-my-zsh"
cp -rn ~/.oh-my-zsh .    

echo "Copy nvim"
cp -rn ~/.config/nvim .config/

echo "Syncing tmux"
cp -rn ~/.tmux.conf .

echo "Syncing alacritty"
cp -rn ~/.config/alacritty/alacritty.toml .config/alacritty/

