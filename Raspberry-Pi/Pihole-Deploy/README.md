# PiHole-Deploy
Used for deploying Pihole servers

# Installation
Run the following commands in the terminal:
```bash
curl -sSLO https://raw.gitusercontent.com/jasonhaymond/Linux/master/Raspberry-Pi/PiHole-Deploy/start.sh | sudo bash
```

# Todo List
- Convert ZeroTier installation into a function.
- Add function for system scheduled automatic updates.
    -  https://askubuntu.com/questions/923535/schedule-apt-get-script-using-cron
- Add reset function to reset pi to factory defaults (if possible).
    -  https://raspberrypi.stackexchange.com/questions/80070/remote-full-reset-re-install-of-a-raspberry
- Add function for setting up DuckDNS.
    -  https://www.duckdns.org/install.jsp?tab=pi&domain=haymondtechnologies
- Add function for setting up system backup.
    -  https://askubuntu.com/questions/2596/comparison-of-backup-tools/2903
- Setup PiHole custom whitelist and blacklist lists.
- Add exit function for cleanup.
    -  http://redsymbol.net/articles/bash-exit-traps/
- Add function for DNS over https.
    -  https://docs.pi-hole.net/guides/dns-over-https/