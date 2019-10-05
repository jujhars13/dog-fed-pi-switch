#!/bin/bash
# setup the raspi with dependencies
# tested on raspbian buster

# run this as root
# sudo su -


apt-get update && apt-get upgrade

apt-get install -y \
npm nodejs docker docker-compose git i2c-tools python3-smbus

# enable i2c pins
echo "dtparam=i2c_arm=on" | tee -a /boot/config.txt

cd /opt
git clone git@github.com:jujhars13/akaal-switch.git
