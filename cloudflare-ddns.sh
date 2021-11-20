#!/bin/bash

# Note: you can find your ZONEID by navigating to the domain page in Cloudflare; it's
# on the bottom right under "API". The RECORDID will be in the audit log when you create
# an entry for the domain, e.g. host.example.com
ZONEID=""
RECORDID=""
APITOKEN=""
HOSTNAME=""

IP=$(curl -s checkip.dyndns.org | grep -oP "(\d{1,3}\.){3}\d{1,3}")

# Be aware this line makes some assumptions about record type, TTL, and Cloudflare proxying.
# More information can be found here: https://api.cloudflare.com/#dns-records-for-a-zone-update-dns-record
curl -X PATCH "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records/$RECORDID" \
     -H "Authorization: Bearer $APITOKEN" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$HOSTNAME\",\"content\":\"$IP\",\"ttl\":3600,\"proxied\":false}"
