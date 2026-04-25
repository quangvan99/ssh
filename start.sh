#!/bin/bash
cd "$(dirname "$0")"
DIR="$(pwd)"

rm -f a.sock

docker run -d \
  --name ctxhh \
  --restart always \
  --network host \
  --cap-add NET_ADMIN \
  --user "$(id -u):$(id -g)" \
  -v "$DIR":/service \
  -v /home/nyb-admin/.local/share/tailscale:/var/lib/tailscale \
  alpine \
  /service/ad --tun=userspace-networking --socket=/service/a.sock --state=/var/lib/tailscale/tailscaled.state

echo "Started via Docker (auto-restart on reboot enabled)"
