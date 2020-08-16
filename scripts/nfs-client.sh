#!/bin/sh --

set -e

echo
echo 'Enabling NFS Client...'
sysrc rpcbind_enable="YES"
sysrc rpc_lockd_enable="YES"
sysrc nfs_client_enable="YES"