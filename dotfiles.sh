#!/bin/bash

DOCS_DIR=$(xdg-user-dir DOCUMENTS)

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

git clone git@github.com:andreygrigol/dotfiles.git "$DOCS_DIR/dotfiles"

cd $DOCS_DIR/dotfiles
cp -r nvim kitty starship.toml fish rofi ~/.config
cp -r tmux/tmux.conf ~/.tmux.conf
cd gnome/
dconf load /org/gnome/shell/extensions/ <extensions.txt
