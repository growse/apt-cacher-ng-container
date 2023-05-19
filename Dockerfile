# syntax=docker/dockerfile:1

FROM debian:bookworm-slim
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y apt-cacher-ng
USER 100
CMD [ "/usr/sbin/apt-cacher-ng" ]

