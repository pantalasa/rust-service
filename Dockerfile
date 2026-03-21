FROM rust:1.86-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
LABEL owner="pantalasa-core-team"
LABEL description="Rust microservice"
COPY --from=builder /app/target/release/rust-service /usr/local/bin/
ENTRYPOINT ["rust-service"]
