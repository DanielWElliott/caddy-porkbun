FROM docker.io/library/caddy:v2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:v2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
