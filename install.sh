
sudo apt-get install ctags php5-xdebug

dirname=`pwd`
if [ -f ~/.vimrc -a ! -h ~/.vimrc ]; then 
   echo "You already have a .vimrc specified.  Make sure you have updated the vimrc in this repository with anything you want to retain and delete the one in your home directory."
   diff vimrc ~/.vimrc
   exit 1
fi
echo "... installing vim directory"
if [ -d ~/.vim ]; then
    if [ -d ~/old_dotvim ]; then
        rm -rf ~/old_dotvim
    fi
    mv ~/.vim ~/old_dotvim
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

echo "To finish the XDebug setup, copy and paste the following into the php config file for your system "
echo "zend_extension = /usr/lib/php5/20060613+lfs/xdebug.so
xdebug.remote_enable = 1
xdebug.remote_port = 9000
xdebug.remote_host = localhost"

echo "For more xdebug info, go to http://developers.blog.box.com/2007/06/20/how-to-debug-php-with-vim-and-xdebug-on-linux/"
