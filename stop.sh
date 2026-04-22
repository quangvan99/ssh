#!/bin/bash
cd "$(dirname "$0")"

if command -v docker &>/dev/null && docker ps -q -f name=tailscale | grep -q .; then
  docker stop tailscale && docker rm tailscale
  echo "Stopped Docker container"
elif [ -f ad.pid ]; then
  kill $(cat ad.pid) && rm ad.pid && echo "Stopped"
else
  echo "Not running"
fi
