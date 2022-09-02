#!/bin/bash

# Create necessary folders
#
mkdir -p \
    /config/{lib,run} \
    /home/unifi \
    /run/supervisord \
    /var/log/{supervisord,unifi}

chown -R unifi:unifi \
    /app/unifi/certbot.sh \
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

# Start supervisor
#
exec /usr/bin/supervisord -c /app/unifi/supervisord.conf