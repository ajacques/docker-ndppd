# docker-ndppd

[View on Docker Hub](https://hub.docker.com/r/ajacques/ndppd/)

This is a Docker container that integrates the NDP-proxy from [DanielAdolfsson/ndppd](https://github.com/DanielAdolfsson/ndppd).

This enables you to proxy IPv6 traffic into your Docker containers.

### Example

```
sudo docker run -e INTERFACE=eth0 -e 'SUBNET_ADDR=2600:0000:dead::beef::/80' --restart=always --cap-drop=ALL --cap-add=NET_ADMIN --cap-add=NET_RAW --net=host ajacques/ndppd:latest
```

#### Docker-Compose

```
NDPProxy:
  cap_add:
    - NET_ADMIN
    - NET_RAW
  cap_drop:
    - ALL
  mem_limit: 16777216
  environment:
    INTERFACE: eth0
    SUBNET_ADDR: 2600:0000:dead::beef::/80
  labels:
    io.rancher.scheduler.global: 'true'
    io.rancher.container.pull_image: always
  log_opt: {}
  image: ajacques/ndppd:latest
  net: host
```
