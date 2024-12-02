# Ubuntu Pwn Environment

Dockerfiles for setting up pwning environments supporting multiple architectures (`amd64`, `x86`, `arm64`). These images provide essential tools for reverse engineering, binary exploitation, and debugging, including `pwntools`, `ropgadget`, and `pwndbg`.

## Features

- **Pre-installed tools**:
  - [Pwntools](https://github.com/Gallopsled/pwntools)
  - [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
  - [Pwndbg](https://github.com/pwndbg/pwndbg)
- **Python virtual environment**: Ensures a clean Python environment for Python-based tools.
- **GDB pre-configured**: Automatically loads `pwndbg` for enhanced debugging capabilities.

## Supported Architectures

- **64-bit (x86_64)**: Modern systems with `amd64` architecture.
- **32-bit (x86)**: Legacy systems with `i386` architecture.
- **64-bit ARM (arm64)**: ARM-based systems such as Apple M1/M2 or ARM servers.

## How to Build and Run

### Prerequisites

- Install [Docker](https://docs.docker.com/get-docker/).
- Ensure QEMU is installed for cross-platform builds (e.g., running `amd64` on `arm64`).

#### Install QEMU (if needed)

```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes