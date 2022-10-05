#!/bin/bash

DOTFILES_DIR="dotfiles"
DOTFILES=$(find $DOTFILES_DIR -type f)

# make basic .zshrc
cp dotfiles/example.zshrc dotfiles/.zshrc

function check_file_exists() {
    for file in $DOTFILES; do
        local home_file="$HOME/$(basename $file)"
        if [ -f  $home_file ]; then
            echo "Error: $home_file is already exist."
            exit 1
        fi
    done
}

function make_symbolic_links() {
    for file in $DOTFILES; do
        local source_file=$(pwd)/$file
        local target_link=$HOME/$(basename $file)
        echo "🔗 Linking file $source_file to $target_link"
        ln -s $source_file $target_link
    done
}

check_file_exists
make_symbolic_links