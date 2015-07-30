#!/bin/bash

set -eu

for mnt in "$@"; do
  mkdir -p "/exports/$mnt"
  echo "/exports/$mnt *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
done

exportfs -a
rpcbind
rpc.statd
rpc.nfsd

exec rpc.mountd --foreground
