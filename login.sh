#!/bin/bash
cd "$(dirname "$0")"
./a --socket=a.sock up --login-server=https://login.tailscale.com
