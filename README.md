# docker-ndppd

https://badge.imagelayers.io/ajacques/ndppd:latest.svg)

This is a Docker container that integrates the NDP-proxy from [DanielAdolfsson/ndppd](https://github.com/DanielAdolfsson/ndppd).

This enables you to proxy IPv6 traffic into your Docker containers.

### Example

```
sudo docker run --restart=always --privileged --net=host -e INTERFACE=eth0 -e 'SUBNET_ADDR=2000:000::/80' ajacques/ndppd:latest
```

#### Docker-Compose

```
NDPProxy:
  environment:
    INTERFACE: eth0
    SUBNET_ADDR: 2600:0000:dead::beef::/80
  labels:
    io.rancher.container.pull_image: always
  log_opt: {}
  image: ajacques/ndppd:latest
  net: host
```
