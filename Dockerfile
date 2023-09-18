# syntax=docker/dockerfile:1

FROM debian:bookworm-20230904-slim

# renovate: datasource=repology depName=debian_12/apt-cacher-ng versioning=loose
ENV APT_CACHER_NG_VERSION="3.7.4-1+b2"
RUN --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y apt-cacher-ng=${APT_CACHER_NG_VERSION}
USER 100
CMD [ "/usr/sbin/apt-cacher-ng", "-c", "/etc/apt-cacher-ng" ]

