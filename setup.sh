#!/bin/bash

CONFIG_DIR="$HOME/dev-config"
ORIGIN_URL="https://raw.githubusercontent.com/SandeepGamot/dev-config/main"

mkdir -p "$CONFIG_DIR"

RC_FILE="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && RC_FILE="$HOME/.zshrc"

scripts=(
	"git.sh"
)

for script in "${scripts[@]}"; do
	echo "fetching script: $script ..."
	curl -sSL "$ORIGIN_URL/$script" -o "$CONFIG_DIR/$script"

	if ! grep -q "source $CONFIG_DIR/$script" "$RC_FILE"; then
		echo "adding $script to $RC_FILE"
		echo "source $CONFIG_DIR/$script" >> "$RC_FILE"
	fi

	echo "done"
done
