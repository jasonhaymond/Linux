#!/bin/bash

installzerotier()
{
    echo "Checking for existing ZeroTier installation..."
    status=$(zerotier-cli status)
    if [ "$status" == *"200 info"* ]
    then
        echo "ZeroTier is already installed."
        read -p "Check for updates? [y/n]: " updates
        if [ "$updates" = "y" ] || [ "$updates" = "Y" ]
        then
            updatezerotier
        else
            echo "Exiting script."
            exit
        fi
    else
        echo "Downloading ZeroTier..."
        curl -LO https://install.zerotier.com | bash
        echo "Enter ZeroTier network ID..."
        zerotier-cli join
    fi
}

updatezerotier()
{
    currentnetworks=$(zerotier-cli listnetworks)
    echo "Listing current networks before updates..."
    echo
    echo "$currentnetworks"
    echo
    echo "Getting updates for ZeroTier..."
    apt-get update
    apt-get upgrade zerotier-one -y
    if [ !"$status" == *"200 info"*"ONLINE" ]
}