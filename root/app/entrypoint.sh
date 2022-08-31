#!/bin/bash

# Make sure folders exists
#
mkdir -p /var/log/{supervisord,unifi}
mkdir -p /run/supervisord

chmod +x /app/certbot/certbot.sh

# Start supervisord
#
exec supervisord -c /app/supervisor/01-supervisord.conf
