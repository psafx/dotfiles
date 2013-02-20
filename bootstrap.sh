cd ~
ln -sf dotfiles/.vimrc .
mkdir .vim
cd .vim
ln -sf ../dotfiles/.vim/syntax .
ln -sf ../dotfiles/.vim/colors .

mkdir backup tmp undo

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
