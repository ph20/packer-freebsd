#!/bin/sh --

set -e

echo 'Adding vagrant user ...'

echo "vagrant" | pw useradd vagrant -h 0 -s /bin/sh -G wheel -c "vagrant"
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /usr/local/etc/sudoers.d/vagrant

echo
echo 'Crating /vagrant directory ...'
mkdir /vagrant
chown vagrant:vagrant /vagrant
echo 'Crating /workspace directory ...'

echo
echo 'Setting up the vagrant ssh keys...'
mkdir -p ~vagrant/.ssh
chmod 0700 ~vagrant/.ssh
cat <<'EOF' > ~vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chown -R vagrant ~vagrant/.ssh
chmod 0600 ~vagrant/.ssh/authorized_keys

echo
echo 'Disabling SSH root login...'
sed -i -e 's/^PermitRootLogin no/#PermitRootLogin yes/' /etc/ssh/sshd_config

