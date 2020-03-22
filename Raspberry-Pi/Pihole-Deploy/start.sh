#!/bin/bash

echo "Installing SVN..."
apt-get install subversion -y

echo "Downloading installation files..."
if [ -d "./Pihole-Deploy" ]
then
    echo "Folder already exists.  Overwriting..."
    rm -rf ./Pihole-Deploy
fi
svn export https://github.com/jasonhaymond/Linux/trunk/Raspberry-Pi/Pihole-Deploy/
find ./Pihole-Deploy/ -type f -iname "*.sh" -exec sudo chmod +x {} \;
cd ./Pihole-Deploy
sh ./install.sh | tee ./piholeinstall.log
finish

finish()
{
    # Cleanup code goes here.
    echo "Cleaning up..."
}
trap finish exit