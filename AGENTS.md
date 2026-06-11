# rust-service — Agent Instructions

## Project Overview

The rust-service component is part of the Pantalasa platform. It provides the
"rust-demo" capability and is owned by carlos@pantalasa.org. Primary implementation language:
rust.

## Architecture

- Source code lives under the repository root and language-standard directories.
- Deployment is managed via Kubernetes and the ArgoCD manifest in `.argocd/`.
- Service metadata is declared in `pantalasa.json`.

## Build Commands

```bash
cargo build --release
cargo test
cargo clippy
```

## Testing

- Run the test suite with the commands above before opening a pull request.
- Add tests alongside the code they cover.

## Code Style

- Follow the standard conventions for rust.
- Keep functions small and focused; prefer clear names over comments.
- Propagate context and handle errors explicitly.

## Common Patterns

- Configuration via environment variables.
- Structured logging.
- Small, reviewable pull requests referencing a ticket.
