#!/bin/bash

# Notes:
# You can get the creds for this by going to your google domain, creatin a DDNS entry, and grabbing
# the creds there.

USER="USERNAME"
PASS="PASSWORD"
HOSTNAME="HOST.EXAMPLE.COM"
URL="https://$USER:$PASS@domains.google.com/nic/update?hostname=$HOSTNAME&myip="

IP=$(curl -s https://domains.google.com/checkip)

# This last line I echo to a log file using crontab, completely optional.
echo `date` `curl -s -X POST $URL$IP`
