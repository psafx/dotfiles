cd ~
ln -sf dotfiles/.vimrc .
mkdir .vim
cd .vim
ln -sf ../dotfiles/.vim/syntax .
ln -sf ../dotfiles/.vim/colors .

mkdir backup tmp undo

mkdir -p ~/.vim/autoload
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
