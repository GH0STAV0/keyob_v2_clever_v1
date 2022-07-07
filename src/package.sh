#!/bin/bash

### every exit != 0 fails the script
set -e
echo "Install Package - on  based ubuntu 20.04 LTS"
DEBIAN_FRONTEND=noninteractive apt-get remove python3.8
apt autoremove -y
apt update --fix-missing
DEBIAN_FRONTEND=noninteractive apt-get -f install  -y \
        jq \
        nano \
        psmisc \
        sudo \
        tini \
        wget python3.9 python3.9-dev openssh-server locate nano 
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
update-alternatives --config python3
echo "Installing ttf-wqy-zenhei"
apt-get install -y ttf-wqy-zenhei software-properties-common \


echo "Installing  xfce "
apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
        xfce4 tightvncserver novnc websockify \
        python3-numpy build-essential net-tools curl git \
        software-properties-common xfce4-terminal xvfb gedit screen
        #uuid-runtime


echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
#apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt update &&  apt install google-chrome-stable -y


wget https://chromedriver.storage.googleapis.com/103.0.5060.53/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && cp chromedriver /usr/bin/


sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage --no-sandbox/g' /opt/google/chrome/google-chrome

