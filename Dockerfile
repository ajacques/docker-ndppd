FROM ubuntu:15.04

ENV VERSION 0.2.4
RUN apt-get update && apt-get install --no-install-recommends -qy g++ make wget ca-certificates && \
# Build source directory
    mkdir /usr/src/ndppd && \
# Fetch source code from GitHub
    wget -q -O - "$@" https://github.com/DanielAdolfsson/ndppd/archive/${VERSION}.tar.gz | tar -xzC /usr/src && \
    cd /usr/src/ndppd-${VERSION} && \
# Build and install into /usr/local/sbin/ directory
    make && make install && \
    cd / && \
# Remove old packages
    apt-get purge -qy g++ make wget ca-certificates && apt-get -qy autoremove && \
# Delete source directories
    rm -rf /usr/src/ndppd-${VERSION} && \
# Delete package caches
    rm -rf /var/lib/apt /var/lib/dpkg /var/log

# Add configuration bootstrapper
ADD init.sh /init.sh

CMD ["/bin/sh", "/init.sh"]
