#!/bin/bash

installzerotier()
{
    echo "Checking for existing ZeroTier installation..."
    status=$(zerotier-cli status)
    if [[ "$status" == *"200 info"* ]]
    then
        echo "ZeroTier is already installed."
        read -p "Check for updates? [y/n]: " updates
        if [ "$updates" = "y" ] || [ "$updates" = "Y" ]
        then
            updatezerotier
        else
            echo "Exiting script."
            finish
        fi
    else
        echo "Downloading ZeroTier..."
        curl -LO https://install.zerotier.com | bash
        
        if [ -n "$networkid" ]
        then
            read -p "Enter ZeroTier network ID..." networkid
        fi
        zerotier-cli join "$networkid"
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
    if [[ ! "$status" == *"200 info"*"ONLINE" ]]
    then
        echo "ZeroTier updates are installed."
        echo "Exiting script."
        finish
    else
        echo "ZeroTier isn't running when it should be after the update."
        echo "Here is the current status of ZeroTier:"
        zerotier-cli status
    fi
}

finish()
{
    # Put cleanup code here.
    echo "Cleaning up..."
}
trap finish exit