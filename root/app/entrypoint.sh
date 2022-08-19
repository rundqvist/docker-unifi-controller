#!/bin/bash

# create our folders
mkdir -p /config/{data,logs,run}
mkdir -p /var/log/{supervisord,unifi}
mkdir -p /run/supervisord


# create symlinks for config
symlinks=( /usr/lib/unifi/data /usr/lib/unifi/logs /usr/lib/unifi/run )

for i in "${symlinks[@]}"
do
[[ -L "$i" && ! "$i" -ef /config/"$(basename "$i")"  ]] && unlink "$i"
[[ ! -L "$i" ]] && ln -s /config/"$(basename "$i")" "$i"
done

exec supervisord -c /app/supervisor/01-supervisord.conf