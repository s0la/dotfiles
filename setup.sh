#alsa installation
sudo apt install -y alsa-base alsa-tools alsa-utils

#xfce-notifyd installation
sudo apt install xfce4-notifyd

#extars installation
sudo apt install -y ubuntu-restricted-extras



#neovim installation

#dependency installation
sudo apt-get install -y libtool libtool-bin autoconf automake cmake g++ pkg-config

#donwload
git clone https://github.com/neovim/neovim.git ~/Downloads/neovim

#installation
cd ~/Downloads/neovim
make
sudo make install

#neovim plugins

#dependency installation
sudo apt install -y python3-pip
pip3 install neovim

#download
wget https://github.com/Shougo/deoplete.nvim/archive/master.zip -P ~/Downloads/deoplete
wget https://github.com/vim-airline/vim-airline/archive/master.zip -P ~/Downloads/vim-airline

#installation
unzip ~/Downloads/deoplete/master.zip -d Downloads/deoplete 'deoplete.nvim-master/*/*'
unzip ~/Downloads/vim-airline/master.zip -d Downloads/vim-airline 'vim-airline-master/*/*'
cp -r ~/Downloads/{deoplete/deoplete.nvim-master/*,vim-airline/vim-airline-master/*} ~/.config/nvim
nvim -c UpdateRemotePlugins +qall



#rofi installation

#dependency download
wget http://security.ubuntu.com/ubuntu/pool/universe/x/xcb-util-xrm/libxcb-xrm0_1.0-2_i386.deb -P ~/Downloads
wget http://security.ubuntu.com/ubuntu/pool/universe/x/xcb-util-xrm/libxcb-xrm-dev_1.0-2_i386.deb -P ~/Downloads
wget http://security.ubuntu.com/ubuntu/pool/main/x/xcb-util/libxcb-util0-dev_0.4.0-0ubuntu3_i386.deb -P ~/Downloads

#dependency installation
sudo apt install -y libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-util-dev libxkbcommon-dev libxkbcommon-x11-dev libpango1.0-dev libstartup-notification0-dev
sudo dpkg -i ~/Downloads/libxcb* 

#download
wget https://github.com/DaveDavenport/rofi/releases/download/1.3.1/rofi-1.3.1.tar.gz -P ~/Downloads

#installation
tar xfC ~/Downloads/rofi-1.3.1.tar.gz ~/Downloads/
cd ~/Downloads/rofi-1.3.1
./configure
make
sudo make install



#xfce-terminal GTK3 installation

#dependency installation
sudo apt install -y libvte-2.91-dev libxfce4ui-2-dev

#download
git clone https://github.com/f2404/xfce4-terminal3.git ~/Downloads/xfce4-terminal

#installation
cd ~/Downloads/xfce4-terminal
./autogen
make
sudo make install



#tmux installation

#dependency download
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz -P ~/Downloads
wget ftp://invisible-island.net/ncurses/ncurses.tar.gz -P ~/Downloads

#dependency installation

#libevent
tar xfC ~/Downloads/libevent-2.1.8-stable.tar.gz ~/Downloads/
cd ~/Downloads/libevent-2.1.8-stable
./autogen
./configure
make
sudo make install

#ncurses
export CPPFLAGS="-P"
tar xfC ~/Downloads/ncurses.tar.gz ~/Downloads
cd ~/Downloads/ncurses-5.9
./configure
make
sudo make install
sudo ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib/

#download
git clone https://github.com/tmux/tmux.git ~/Downloads/tmux

#installation
cd ~/Downloads/tmux
./autogen
./configure
make
sudo make install



#lemonbar xft installation

#download
git clone https://github.com/krypt-n/bar.git ~/Downloads/bar

#installation
cd ~/Downloads/bar
make
sudo make install


#cleaning
cd
rm -rf ~/Downloads/{neovim,deoplete,vim-airline,libxcb*,rofi*,xfce4-terminal,libevent*,ncurses*,tmux,bar}

#coping thing in the right place
find .dotfiles/ -mindepth 1 -maxdepth 1 -name ".*" -exec cp -r {} ~/ \;

#font caching
fc-cache -vf

#theming
git clone https://github.com/s0la/themes .themes
git clone https://github.com/s0la/icons .icons
wget https://www.dropbox.com/s/pwy2c8htosazn4k/Alkano-Aluminium.tgz?dl=0 -O ~/Downloads/alkano.tgz
sudo tar xfC ~/Downloads/alkano.tgz /usr/share/icons
sudo ln -s /usr/share/icons/Alkano-Aluminium .icons/default

#applying configuration
openbox --reconfigure
