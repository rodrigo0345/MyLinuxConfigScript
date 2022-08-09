#! /bin/bash

sudo apt-get update

# defaults
SYS="Debian"
PKG="apt-get"

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo "Select one of the options below:
    1. ${Red}Debian based system${Color_Off}
    Selection: "
read selection

if [ -z "$selection" ]; then
    echo "No selection made, defaulting to Debian"
    SYS="Debian"
elif [ "$selection" -gt "1" ]; then
    echo "Error: Invalid selection"
    exit 1
fi

# debian based distros 
if [ $selection -eq 1 ]; then
    echo "Debian based system selected"
    SYS="Debian"
    PKG="apt-get"
fi

if [ "$SYS" = "Debian" ]; then
    echo "Debian installation"

    sudo dpkg --configure -a

    # install neofetch
    sudo $PKG install neofetch -y

    # install visual studio code and extensions
    sudo $PKG install code -y

    code --install-extension inci-august.august-themes

    # cpp tools
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.cpptools-extension-pack

    # code runner
    code --install-extension formulahendry.code-runner
    
    # java tools
    code --install-extension vscjava.vscode-java-pack
    code --install-extension vscjava.vscode-java-debug
    code --install-extension GitHub.copilot
    code --install-extension VisualStudioExptTeam.vscodeintellicode
    code --install-extension redhat.java
    code --install-extension ms-python.python
    code --install-extension vscode-icons-team.vscode-icons

    #install java, nodejs, python and git
    sudo $PKG install git -y

    sudo $PKG install openjdk-8-jre -y
    sudo $PKG install openjdk-8-jdk -y

    sudo $PKG install node -y || sudo $PKG install nodejs -y
    sudo $PKG install npm -y

    sudo $PKG install python3 python3-pip build-essential python3-dev -y

    # install brave browser
    sudo $PKG install apt-transport-https curl -y

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo $PKG update

    sudo $PKG install brave-browser -y

    # install lutris and steam
    sudo $PKG install lutris steam -y

    # install discord
    sudo $PKG install discord -y

    # install tlp
    sudo $PKG install tlp -y

    sudo $PKG upgrade
fi
