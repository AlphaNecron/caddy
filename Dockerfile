FROM --platform=linux/amd64 caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM --platform=linux/amd64 caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

FROM --platform=linux/arm/v7 arm32v7/caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM --platform=linux/arm/v7 arm32v7/caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
