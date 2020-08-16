#!/bin/sh --

set -e

echo 'Setting up VM Tools (vmware guest) ...'

pkg-static install -y open-vm-tools-nox11
sysrc vmware_guest_vmblock_enable=YES
sysrc vmware_guest_vmmemctl_enable=YES

sysrc vmware_guest_vmxnet_enable=YES
# Disable vmxnet in favor of whatever the OpenVM Tools are suggesting
sed -i -e 's#^ifconfig_vmx0#ifconfig_em0#g' /etc/rc.conf
sed -i -e '/^if_vmx_load=.*/d' /boot/loader.conf

sysrc vmware_guestd_enable=YES
sysrc fusefs_enable=YES
echo 'fuse_load="YES"' >> /boot/loader.conf