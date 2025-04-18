FROM --platform=$BUILDPLATFORM docker.io/library/caddy:2.9.1-builder AS builder

ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM docker.io/library/caddy:2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
