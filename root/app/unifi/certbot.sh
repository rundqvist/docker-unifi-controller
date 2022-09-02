#!/bin/bash

# Update certificates
#
/usr/sbin/update-ca-certificates -f > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "$(date) [INF] Certificates updated."
else
    echo "$(date) [ERR] Failed to update certificates."
fi

# Sleep 24h before next update
#
exec sleep 86400
