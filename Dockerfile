FROM --platform=${BUILDPLATFORM} caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM --platform=${BUILDPLATFORM} caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
