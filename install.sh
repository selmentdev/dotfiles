#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

notify_stage() {
    echo "\033[32m$1\033[0m"
}

link_file() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

notify_stage "Installing/Updating dotfiles..."

if [ ! -e $dotfiles/.git ]; then
    notify_stage "Cloning dotfiles"
    git clone https://github.com/selmentdev/dotfiles.git $dotfiles
else
    notify_stage "Updating dotfiles"
    cd $dotfiles && git pull
fi

notify_stage "Setup ZSH"
link_file $dotfiles/zprofile $HOME/.zprofile

notify_stage "Setup VIM"
link_file $dotfiles/vimrc $HOME/.vimrc
