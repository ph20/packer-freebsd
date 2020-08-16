#!/bin/sh --

set -e

echo 'Setting up VM Tools (virtualbox guest) ...'

pkg-static install -y virtualbox-ose-additions-nox11
sysrc ifconfig_em1="inet 10.6.66.42 netmask 255.255.255.0"
sysrc vboxguest_enable="YES"
sysrc vboxservice_enable="YES"

sysrc vboxservice_flags="--disable-timesync"
echo "WITHOUT_NTP= YES # time sync is handled by VirtualBox" >> /etc/src.conf