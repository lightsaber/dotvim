
sudo apt-get install ctags

dirname=`pwd`
if [ -e ~/.vimrc -a ! -h ~/.vimrc ]; then 
   echo "You already have a .vimrc specified.  Make sure you have updated the vimrc in this repository with anything you want to retain and delete the one in your home directory."
   diff vimrc ~/.vimrc
   exit 1
fi
echo "... installing vim directory"
if [ -e ~/.vim ]; then
    mv ~/.vim ~/oldvim_$(date +%Y%m%d)
fi

cp -r $dirname ~/.vim

echo "... creating symlinks for config files"
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim
echo "... initializing modules"
git submodule update --init

echo "... configuring pathogen"
mkdir autoload
ln -s ~/.vim/bundle/pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

echo "VIM setup complete"
