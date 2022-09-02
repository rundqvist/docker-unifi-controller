#!/bin/bash

# Create necessary folders
#
mkdir -p /config/{lib,run}
mkdir -p /var/log/supervisord
mkdir -p /var/log/unifi

# Start supervisor
#
/usr/bin/supervisord -c /app/supervisor/01-supervisord.conf