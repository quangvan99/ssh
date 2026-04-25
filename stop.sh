#!/bin/bash
cd "$(dirname "$0")"

if docker ps -q -f name=ctxhh | grep -q .; then
  docker stop ctxhh && docker rm ctxhh
  rm -f a.sock
  echo "Stopped"
else
  echo "Not running"
fi
