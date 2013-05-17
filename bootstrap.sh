cd ~
ln -sf dotfiles/.vimrc .
mkdir .vim
cd .vim
ln -sf ../dotfiles/.vim/syntax .
ln -sf ../dotfiles/.vim/colors .

mkdir backup tmp undo
