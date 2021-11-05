#!/bin/bash

while true; do
  read -p "WARNING: Please make sure what you are doing(y/n)? " yn
    case $yn in
        [Yy]* )
          echo 'configuring...';
          break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd
touch .tmux.config
if grep 'source ~/.vim/tmux.config' .tmux.config
then
  echo 'source exists in tmux.config'
else
  echo 'source not exists in tmux.config'
  echo 'source written in tmux.config!'
  echo 'source ~/.vim/tmux.config' >> .tmux.config
fi

touch .vimrc
if grep 'source ~/.vim/vimrc.vim' .vimrc
then
  echo 'source exists in .vimrc'
else
  echo 'source not exists in .vimrc'
  echo 'source written in .vimrc!'
  echo 'source ~/.vim/vimrc.vim' >> .vimrc
fi

touch .zshrc
if grep 'source ~/.vim/zshrc' .zshrc
then
  echo 'source exists in .zshrc'
else
  echo 'source not exists in .zshrc'
  echo 'source written in .zshrc!'
  echo 'source ~/.vim/zshrc' >> .zshrc
fi

# cp

while true; do
  read -p "Do you wish to overwrite gitconfig(y/n)? " yn
    case $yn in
        [Yy]* )
          echo 'overwrite gitconfig';
          touch .gitconfig
          touch .gitmessage
          cp .gitconfig .gitconfig-save;
          cp .gitmessage .gitmessage-save;
          cp .vim/gitmessage .gitmessage;
          cat .vim/gitconfig >> .gitconfig;
          break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

vim +'PlugInstall --sync' +qa
python3 ~/.vim/plugged/YouCompleteMe/install.py --all
