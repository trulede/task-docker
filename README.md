# Task Docker

A minimal multi-architecture Docker image with [Task](https://taskfile.dev/) installed.

## Image Details

- **Base Image**: `scratch` (minimal footprint)
- **Supported Architectures**: 
  - Linux: amd64, arm64, armv7
- **Registry**: `ghcr.io/trulede/task`

## Usage

```bash
docker run --rm ghcr.io/trulede/task:latest --version
```

## License

This project is licensed under the Apache 2.0 License.
