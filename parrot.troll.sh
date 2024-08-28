#!/bin/bash

# Define the code you want to inject
code_to_inject=$(cat <<'EOF'
# Custom aliases
alias ll='ls -la'
alias gs='git status'

# Add custom path
export PATH="$HOME/bin:$PATH"
EOF
)

# Check if the code is already in .zshrc to prevent duplicates
if ! grep -q "$code_to_inject" ~/.zshrc; then
    echo "$code_to_inject" >> ~/.zshrc
    echo "Code injected into ~/.zshrc"
else
    echo "Code already exists in ~/.zshrc"
fi
