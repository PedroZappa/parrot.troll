#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
# Gawk! Hey you security threat!
# Pay attention, lock your machine when you leave you silly simian! 
# Curl, the Parrot 🦜
# *Pixelates and fades into cyberspace*
trap '' 2
stty susp undef
curl parrot.live
EOF
)

if ! grep -q "$PARROT_TROLL" ~/.zshrc; then
    echo "$PARROT_TROLL" >> ~/.zshrc
    echo "Parrot Troll 🦜 added to ~/.zshrc"
fi
