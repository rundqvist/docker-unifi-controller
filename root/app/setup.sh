#!/bin/bash

# Create necessary folders
#
mkdir -p \
    /config \
    /home/unifi \
    /run/supervisord \
    /var/log/{supervisord,unifi}

# Set permissions
#
chmod +x \
    /app/entrypoint.sh \
    /app/certbot/certbot.sh

chown -R unifi:unifi \
    /app/certbot/certbot.sh \
    /config \
    /etc/ssl/certs \
    /home/unifi \
    /run/supervisord \
    /var/log/supervisord

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
