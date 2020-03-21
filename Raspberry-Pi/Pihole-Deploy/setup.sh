#!/bin/bash

echo
echo
echo "Setup script 'setup.sh' script Ver 1.63"
echo
echo


curl -LO https://raw.githubusercontent.com/jasonhaymond/PiHole-Deploy/master/pihole-setup.sh
sudo chmod +x ./pihole-setup.sh
sudo ./pihole-setup.sh | sudo tee ./piholeinstall.log
exit