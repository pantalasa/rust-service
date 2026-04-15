FROM rust:1.86-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
LABEL owner="pantalasa-core-team"
LABEL description="Rust microservice"
LABEL org.opencontainers.image.revision="${GIT_SHA}"
RUN groupadd -r app && useradd -r -g app -d /home/app -s /sbin/nologin app
COPY --from=builder /app/target/release/rust-service /usr/local/bin/
USER app
HEALTHCHECK --interval=30s --timeout=3s CMD ["rust-service", "--health"]
ENTRYPOINT ["rust-service"]
