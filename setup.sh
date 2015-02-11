#!/bin/bash -e

dir=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
echo "Installing coreydowning's dotfiles to ${HOME} from ${dir}"

if [ ! -d ${dir}/vim/bundle/vundle ]
then
  echo "Getting Vundle..."
  git clone -q https://github.com/gmarik/Vundle.vim.git ${dir}/vim/bundle/vundle
fi

echo "Setting up vim"
ln -sf ${dir}/vimrc ${HOME}/.vimrc
rm ${HOME}/.vim
ln -sf ${dir}/vim ${HOME}/.vim
mv ${dir}/vim/settings/appearance.vim ${dir}/vim/settings/appearance.ignore
vim +PluginInstall +qall
mv ${dir}/vim/settings/appearance.ignore ${dir}/vim/settings/appearance.vim

echo "Setting up zsh"
ln -sf ${dir}/zshrc ${HOME}/.zshrc

echo "Setting up git"
ln -sf ${dir}/gitconfig ${HOME}/.gitconfig
ln -sf ${dir}/gitignore ${HOME}/.gitignore

echo "DONE!"

