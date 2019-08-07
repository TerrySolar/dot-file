#!/usr/bin/env bash

term256=`ls terminal-256-color`

# use terminal 256 color
echo 'tic terminale 256 color...'
for file in ${term256}
do
    tic 'terminal-256-color'/${file}
done
echo 'tic terminale 256 color done!'


if [ -e "$HOME/.tmux.conf" ]; then
    echo "found .tmux.conf in your home directory, create a backup at $HOME/.tmux.conf.bak\n"
    cp -f "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak" 2>/dev/null
fi

if [ -e "$HOME/.vimrc" ]; then
    echo "found .vimrc in your home directory, create a backup at $HOME/.vimrc.bak\n"
    cp -f "$HOME/.vimrc" "$HOME/.vimrc.bak" 2>/dev/null
fi

if [ -d "$HOME/.vim" ]; then
    echo "found .vim directory in your home directory, create a backup at $HOME/.vim.bak\n"
    cp -rf "$HOME/.vim" "$HOME/.vim.bak" 2>/dev/null
fi


if [ ! -d "./.vim" ]; then
    tar -zxf vim.tar.gz
fi

if [ ! -d "$HOME/.vim_undo" ]; then
    mkdir "$HOME/.vim_undo"
fi

rm -rf "$HOME/.vim"
cp -rf .vim "$HOME/.vim"
cp -rf tmux.conf "$HOME/.tmux.conf"
cp -rf vimrc "$HOME/.vimrc"

echo "env setup done!!!"
