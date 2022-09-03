# UniFi Controller
Ubiquiti UniFi Network Application (commonly known as UniFi Controller) from official package source with both 32 and 64-bit support (ARMv7 still supported).

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/unifi-controller.svg)](https://hub.docker.com/r/rundqvist/unifi-controller)
[![image size](https://img.shields.io/docker/image-size/rundqvist/unifi-controller.svg)](https://hub.docker.com/r/rundqvist/unifi-controller)
[![commit activity](https://img.shields.io/github/commit-activity/m/rundqvist/docker-unifi-controller)](https://github.com/rundqvist/docker-unifi-controller)
[![last commit](https://img.shields.io/github/last-commit/rundqvist/docker-unifi-controller.svg)](https://github.com/rundqvist/docker-unifi-controller)

## Features
* UniFi Network Application. No more, no less.

## Components
* [Ubuntu (Xenial)](https://ubuntu.com)
* [Supervisor](https://github.com/Supervisor/supervisor)
* [UniFi Network Application](https://help.ui.com/hc/en-us/articles/1500012237441-UniFi-Network-Use-the-UniFi-Network-Application)

## Run
```
docker run \
    -d \
    -p 1900:1900/udp \
    -p 3478:3478/udp \
    -p 5514:5514/udp \
    -p 6789:6789 \
    -p 8080:8080/tcp \
    -p 8443:8443/tcp \
    -p 8843:8843 \
    -p 8880:8880 \
    -p 10001:10001/udp \
    -v /local/path/to/config:/config \
    -v /local/path/to/log:/var/log \
    -v /etc/localtime:/etc/localtime:ro \
    --name unifi \
    rundqvist/unifi-controller
```

## Docker compose
```
version: "3"
services:
  unifi:
    image: rundqvist/unifi-controller
    container_name: unifi
    volumes:
      - /local/path/to/config:/config
      - /local/path/to/log:/var/log
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 1900:1900/udp
      - 3478:3478/udp
      - 5514:5514/udp
      - 6789:6789      
      - 8080:8080/tcp      
      - 8443:8443/tcp
      - 8843:8843
      - 8880:8880
      - 10001:10001/udp
    restart: unless-stopped
```

## References
For port details, please see [UniFi Network - Required Ports Reference](https://help.ui.com/hc/en-us/articles/218506997-UniFi-Network-Required-Ports-Reference)

## Issues and feature requests
Please report issues at https://github.com/rundqvist/docker-unifi-controller/issues

## Donations
Please support the development by making a small donation.

[![Revolut](https://img.shields.io/badge/support-Revolut-0665eb)](https://revolut.me/qvist)
[![Flattr](https://img.shields.io/badge/support-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![By me a coffee](https://img.shields.io/badge/support-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![PayPal](https://img.shields.io/badge/support-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)