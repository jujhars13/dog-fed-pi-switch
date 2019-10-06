#!/bin/bash
# setup the raspi with dependencies
# tested on raspbian buster

# remember to setup WIfi first, edit /etc/wpa_supplicant/wpa_supplicant.conf https://learn.sparkfun.com/tutorials/using-pcduinos-wifi-dongle-with-the-pi/edit-wpasupplicantconf
# run this as root
# sudo su -

apt-get update && apt-get upgrade -y
apt-get install -y \
  git i2c-tools unattended-upgrades apt-listchanges vim
# use sudo i2cdetect -y 1 to detect LCD address
# remember to use `raspi-config` to enable i2c kernel module
# @see https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-i2c

# app specific dependencies
apt-get install -y \
  python3-rpi.gpio python3-smbus
  #python3-alsaaudio \
  #alsa-utils festival

# configure all auto updates, not just security ones
sed -i "s/\/\/      \"origin=Debian,codename=/        \"origin=Debian,codename=/g" /etc/apt/apt.conf.d/50unattended-upgrades

# # enable sound card
# echo "snd_bcm2835" | tee -a /etc/modules
# # set volume low to prevent background noise from onboard card
# amixer sset PCM,0 1%

# enable i2c pins
echo "dtparam=i2c_arm=on" | tee -a /boot/config.txt
# disable display ports for power saving
echo "hdmi_blanking=1" | tee -a /boot/config.txt
echo "enable_tvout=0" | tee -a /boot/config.txt

# deploy application via github, use https to avoid host + key issues
# use a subshell to avoid dir issues
(cd /opt || exit; git clone https://github.com/jujhars13/akaal-switch)

# deploy systemd service
cp /opt/akaal-switch/systemd.service /lib/systemd/system/akaalButton.service
chmod 644 /lib/systemd/system/akaalButton.service
systemctl daemon-reload
systemctl enable akaalButton.service

# deploy git pull on restart
# use rc.local to prevent directory permissions issues from cron.d
# add entry to just before last line `exit 0`
# NB rc.local runs !#/bin/sh not !#bin/bash
export totalLength=$(($(< /etc/rc.local wc -l)-1))
sed -i "${totalLength}a\
# pull latest Akaal switch code\n/opt/akaal-switch/git-pull.sh\n" /etc/rc.local

# reboot every night to apply any kernel updates and get latest code
echo $'#!/bin/bash
echo "rebooting $(date)"
shutdown -r now' > /etc/cron.daily/zz-daily-reboot
chmod +x /etc/cron.daily/zz-daily-reboot
