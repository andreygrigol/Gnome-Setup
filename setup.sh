#!/bin/bash

mkdir ~/.local/share/icons

if command -v pacman >/dev/null 2>&1; then
	sudo pacman -S kitty fish tmux neovim nodejs npm python-virtualenv rofi starship
elif command -v apt >/dev/null 2>&1; then
	sudo apt install kitty fish tmux nodejs npm python3-virtualenv rofi
else
	echo "Could not identify which package manager is using!"
fi

DOCS_DIR=$(xdg-user-dir DOCUMENTS)
mkdir "$DOCS_DIR/Gruvbox"

if [ -z "$DOCS_DIR" ]; then
	if [ -d "$HOME/Documentos" ]; then
		DOCS_DIR="$HOME/Documentos"
	elif [ -d "$HOME/Documents" ]; then
		DOCS_DIR="$HOME/Documents"
	else
		DOCS_DIR="$HOME/Documentos"
		mkdir -p "$DOCS_DIR"
	fi
fi

git clone https://github.com/SylEleuth/gruvbox-plus-icon-pack.git "$DOCS_DIR/Gruvbox/gruvbox-plus-icon-pack"
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme "$DOCS_DIR/Gruvbox/Gruvbox-GTK-Theme"

cd $DOCS_DIR/Gruvbox/Gruvbox-GTK-Theme/themes/
./install.sh -t orange -c dark -l --tweaks soft float macos

cp -r $DOCS_DIR/Gruvbox/gruvbox-plus-icon-pack/Gruvbox-Plus-Dark ~/.local/share/icons/
