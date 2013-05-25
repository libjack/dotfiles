dotfiles
========

manage my dotfiles

vim setup
---------
    curl -Sso ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

prepend to vimrc:

    execute pathogen#infect()
    runtime bundle/vim-pathogen/autoload/pathogen.vim

Pathogen lets all other plugins startup from within bundle directory
also provides :Helptags to take care of docs

other plugins loaded:
* git clone https://github.com/Lokaltog/vim-powerline.git bundle/vim-powerline
* git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
* git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree
* git clone https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
