# vimconfig
.vim directory.

## Installation

```Shell
cd ~
git clone git@github.com:gra98rus/vimconfig.git .vim
ln -s .vim/vimrc .vimrc
cd ~/.vim/
git submodule update --init --recursive
```

In order for VIM to work with the system buffer, it is necessary to install the following packages:

```Shell
sudo apt install vim-gtk xsel
```
