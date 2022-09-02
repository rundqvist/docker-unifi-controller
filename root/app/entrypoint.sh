#!/bin/bash

mkdir -p /config/{lib,log,run}

#sleep 12345
/usr/bin/supervisord -c /app/supervisor/01-supervisord.conf