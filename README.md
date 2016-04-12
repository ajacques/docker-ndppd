# docker-ndppd

This is a Docker container that integrates the NDP-proxy from [DanielAdolfsson/ndppd](https://github.com/DanielAdolfsson/ndppd).

This enables you to proxy IPv6 traffic into your Docker containers.

### Example

```
sudo docker run --privileged --net=host -e INTERFACE=eth0 -e 'SUBNET_ADDR=2000:000::/80' -ti --rm -t ndppd
```
