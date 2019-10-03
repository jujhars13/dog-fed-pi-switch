#!/bin/bash
# setup the raspi

sudo su -

apt-get update && apt-get upgrade

apt-get install -y \
nodejs docker docker-compose git

cd /opt
git clone git@github.com:jujhars13/akaal-switch.git
