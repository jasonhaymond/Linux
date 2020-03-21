#!/bin/bash

sudo chmod +x ./install.sh
sudo ./install.sh | sudo tee ./piholeinstall.log
finish

finish()
{
    # Cleanup code goes here.
    echo "Cleaning up..."
}
trap finish exit