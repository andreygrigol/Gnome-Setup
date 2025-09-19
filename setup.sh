#!/bin/bash

mkdir ~/.local/share/icons

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

git clone https://github.com/SylEleuth/gruvbox-plus-icon-pack.git "$DOCS_DIR/Gruvbox"
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme "$DOCS_DIR/Gruvbox"
