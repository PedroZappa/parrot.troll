#!/bin/bash

# Append the lines to the .zshrc file
echo "" >> ~/.zshrc
echo "# Parrot alias" >> ~/.zshrc
echo "alias parrot=\"echo 'You have been trolled by the parrot!'\"" >> ~/.zshrc
echo "" >> ~/.zshrc

# Reload the .zshrc to apply changes immediately
source ~/.zshrc

# Optional: Print a message
echo "Parrot alias added to your .zshrc!"

