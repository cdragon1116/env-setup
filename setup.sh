#!/bin/bash

function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

function info()
{
  local arg1=$1
  coloredEcho "[Info] ${arg1}" green
}

function warn()
{
  local arg1=$1
  coloredEcho "[WARNING] ${arg1}" red
}

function install()
{
  local arg1=$1
  coloredEcho "[Install] ${arg1}" blue
}

brew_install() {
  install "$1"
  if brew list $1 &>/dev/null; then
    info "${1} is already installed"
  else
    brew install $1 && echo "$1 is installed"
  fi
}

touch .vimrc
if grep 'source ~/.vim/vimrc.vim' .vimrc
then
  info 'source exists in .vimrc'
else
  info 'source not exists in .vimrc'
  info 'source written in .vimrc!'
  echo 'source ~/.vim/vimrc.vim' >> .vimrc
fi

touch .zshrc
if grep 'source ~/.vim/zshrc' .zshrc
then
  info 'source exists in .zshrc'
else
  info 'source not exists in .zshrc'
  info 'source written in .zshrc!'
  echo 'source ~/.vim/zshrc' >> .zshrc
fi

# cp
warn "Do you wish to overwrite gitconfig(y/n)? "
while true; do
  read -p "Yes or No (y/n): " yn
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
        [Nn]* ) break;;
        * ) info "Please answer yes or no.";;
    esac
done

install 'Homebrew';
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  info 'homebrew installed';
else
  info 'homebrew installed';
  # brew update
fi

# install vim
install "Brew Vim"
brew install vim && brew link vim --force

install 'Oh my Zsh';
which -s zsh
if [[ $? != 0 ]] ; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  info 'Oh my Zsh Complete';
else
  info 'Oh my Zsh already installed';
  # brew update
fi

brew_install zsh-autosuggestions

info 'Run PlugInstall in vim';
vim +'PlugInstall --sync' +qa

brew_install cmake
brew_install python
brew_install go
brew_install fzf
brew_install ag
brew_install diff-so-fancy
brew_install autojump
brew_install nodejs

warn "Do you wish to complie YouCompleteMe(y/n)? "
while true; do
  read -p "Yes or No (y/n): " yn
    case $yn in
        [Yy]* )
          if [[ `uname -m` == 'arm64' ]];
          then
            echo "Your are in M1 model";
            brew_install llvm
            python3 ~/.vim/plugged/YouCompleteMe/install.py --system-libclang --all

            if grep 'ycm_clangd_binary_path' ~/.vimrc
            then
              info 'ycm_clangd_binary_path init'
            else
              echo "\" For arm64 Macs, we need to use Homebrew's clangd" >> ~/.vimrc
              echo "let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'" >> ~/.vimrc
              info 'ycm_clangd_binary_path init'
            fi
          else
            info "Your are in Intel model";
            brew_install mono
            python3 ~/.vim/plugged/YouCompleteMe/install.py --all
          fi
          break;;
        [Nn]* ) break;;
        * ) info "Please answer yes or no.";;
    esac
done

info "Please reboot your Iterm."

exit
