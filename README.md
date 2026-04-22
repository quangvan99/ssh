# Service

## Usage

Start the service:

```bash
./start.sh
```

Or run manually:

```bash
./ad --tun=userspace-networking --socket=a.sock
./a --socket=a.sock up --login-server=https://login.tailscale.com
```

## Stop

```bash
./stop.sh
```
