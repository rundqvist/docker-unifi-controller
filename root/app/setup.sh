#!/bin/bash

# Start supervisord
#
#exec supervisord -c /app/supervisor/01-supervisord.conf

mkdir -p /var/log/supervisord
mkdir -p /var/log/unifi
mkdir -p /run/supervisord
mkdir -p /config 
chmod +x /app/entrypoint.sh /app/certbot/certbot.sh
chown -R unifi:unifi /config /app/certbot/certbot.sh /var/log/supervisord /run/supervisord /etc/ssl/certs

F=(lib log run)
for f in "${F[@]}"
do
    if [ -L /var/$f/unifi ]
    then
        unlink /var/$f/unifi
    fi

    rm -rf /var/$f/unifi
    ln -s /config/$f /var/$f/unifi
done
#mkdir -p /config/{data,logs,run}
#ln -s /config/data /var/lib/unifi
#ln -s /config/logs /var/log/unifi
#ln -s /config/run /var/run/unifi