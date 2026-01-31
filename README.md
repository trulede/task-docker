# Task Docker

A minimal multi-architecture Docker image with [Task](https://taskfile.dev/) installed.

## Image Details

- **Base Image**: `scratch` (minimal footprint)
- **Supported Architectures**: 
  - Linux: amd64, arm64, armv7
  - Windows: amd64
- **Registry**: `ghcr.io/trulede/task`

## Usage

```bash
docker run --rm ghcr.io/trulede/task:latest --version
```

## License

This project is licensed under the GPL-2.0 License.