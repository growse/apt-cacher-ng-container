# syntax=docker/dockerfile:1

FROM debian:bookworm-slim
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y apt-cacher-ng
RUN echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf
RUN echo "Foreground: 1" >> /etc/apt-cacher-ng/acng.conf
RUN echo "SocketPath: /run/acng-socket" >> /etc/apt-cacher-ng/acng.conf
RUN echo "AllowUserPorts: 0" >> /etc/apt-cacher-ng/acng.conf
USER 100
CMD [ "/usr/sbin/apt-cacher-ng", "foreground:1", "SocketPath:/tmp/acng-socket", "Port:3142", "-v" ]

