#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

link_file() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

echo "Installing/Updating dotfiles...\n"

if [ ! -e $dotfiles/.git ]; then
    echo "Cloning dotfiles\n"
    git clone https://github.com/selmentdev/dotfiles.git $dotfiles
else
    echo "Updating dotfiles\n"
    cd $dotfiles && git pull
fi

echo "Setup ZSH\n"
link_file $dotfiles/zprofile $HOME/.zprofile

echo "Setup VIM\n"
link_file $dotfiles/vimrc $HOME/.vimrc
