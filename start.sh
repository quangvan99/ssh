#!/bin/bash
cd "$(dirname "$0")"
DIR="$(pwd)"

rm -f a.sock

if command -v docker &>/dev/null; then
  docker run -d \
    --name ctxhh \
    --restart always \
    --network host \
    --cap-add NET_ADMIN \
    -v "$DIR":/service \
    -v /home/nvidia/.local/share/tailscale:/var/lib/tailscale \
    alpine \
    /service/ad --tun=userspace-networking --socket=/service/a.sock --state=/var/lib/tailscale/tailscaled.state
  echo "Started via Docker (auto-restart on reboot enabled)"
else
  nohup ./ad --tun=userspace-networking --socket=a.sock > ad.log 2>&1 &
  echo $! > ad.pid
  echo "Started directly (PID $(cat ad.pid))"
fi
