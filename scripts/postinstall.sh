#!/bin/sh --

set -e

echo 'Running post-install..'

echo 'Disabling jemalloc(3) debugging...'
ln -sf 'abort:false,junk:false' /etc/malloc.conf
echo

echo 'Updating /boot/loader.conf...'
echo '  * Disabling Beastie boot screen'
cat <<'EOF' >> /boot/loader.conf
beastie_disable="YES"
kern.hz=50
EOF

# Configure fetch(3)
export FETCH_RETRY=5
export FETCH_TIMEOUT=30
export SSL_NO_VERIFY_PEER=1

echo 'Bootstrapping pkg(1)...'
ASSUME_ALWAYS_YES=yes pkg bootstrap

echo 'Update the pkg database...'
sh -c 'cd /tmp && exec pkg-static update'

echo 'Upgrade pkg database...'
sh -c 'cd /tmp && exec pkg-static upgrade -n'

#echo 'Initializing the pkg audit database...'
#sh -c 'cd /tmp && exec pkg-static audit -F'

echo
echo 'Setting up ca_root_nss...'
pkg-static install -y ca_root_nss

echo
echo 'Setting up sudo...'
pkg-static install -y sudo

echo
echo 'Updating locate(1) database...'
/etc/periodic/weekly/310.locate

echo
echo 'Post-install complete.'
