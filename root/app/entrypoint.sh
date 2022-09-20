#!/bin/bash

# Create necessary folders
#
mkdir -p \
    /config/{lib,run} \
    /home/unifi \
    /run/supervisord \
    /var/log/{supervisord,unifi}

chown -R unifi:unifi \
    /config/{lib,run} \
    /etc/ssl/certs \
    /home/unifi \
    /run/supervisord \
    /var/log/{supervisord,unifi}

# Link folders for easier mount
#
ln -s /var/log/unifi /home/unifi/logs

F=(lib run)
for f in "${F[@]}"
do
    if [ -L /var/$f/unifi ]
    then
        unlink /var/$f/unifi
    fi

    rm -rf /var/$f/unifi
    ln -s /config/$f /var/$f/unifi
done

# Update certificates
#
/usr/sbin/update-ca-certificates -f > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "$(date) [INF] Certificates updated."
else
    echo "$(date) [ERR] Failed to update certificates."
fi

# Start supervisor
#
exec /usr/bin/supervisord -c /app/unifi/supervisord.conf