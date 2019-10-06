#!/bin/bash
# setup the raspi with dependencies
# tested on raspbian buster

# run this as root
# sudo su -

apt-get update && apt-get upgrade
apt-get install -y \
  git i2c-tools

# app specific dependencies
apt-get install -y \
  python3-rpi.gpio python3-smbus

# enable i2c pins
echo "dtparam=i2c_arm=on" | tee -a /boot/config.txt
# disable display ports for power saving
echo "hdmi_blanking=1" | tee -a /boot/config.txt
echo "enable_tvout=1" | tee -a /boot/config.txt

# deploy application, use https to avoid host + key issues
cd /opt && git clone https://github.com/jujhars13/akaal-switch

# deploy service
cp /opt/akaal-switch/systemd.service /lib/systemd/system/akaalButton.service
chmod 644 /lib/systemd/system/akaalButton.service

# deploy git pull on restart
echo $"@reboot cd /opt/akaal-switch && git pull " | tee -a /etc/cron.d/akaal-switch-git-pull
chmod +x /etc/cron.d/akaal-switch-git-pull
