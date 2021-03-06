#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

# check for mvim installation
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Checking for brew ....."
  which -s brew
  if [[ $? != 0 ]] ; then
    echo "Brew not found. Starting install now ...."
    # Install Homebrew
    # https://github.com/mxcl/homebrew/wiki/installation
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    echo "Brew install complete!"
  else
    echo "Brew found. Running update...."
    brew update
  fi
  echo "Installing macvim and vim"
  brew install macvim vim
fi
