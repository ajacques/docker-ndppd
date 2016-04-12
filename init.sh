#!/bin/sh

[ -z "$INTERFACE" ] && echo "Environment variable INTERFACE should be in format 'eth0'" && exit 1;
[ -z "$SUBNET_ADDR" ] && echo "Environment variable SUBNET_ADDR should be in format '2000:000::/80'" && exit 1;

echo "proxy $INTERFACE { rule $SUBNET_ADDR { auto } }" > /etc/ndppd.conf

exec /usr/local/sbin/ndppd -c /etc/ndppd.conf
