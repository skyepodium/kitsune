# description: Unified Dockerfile for 32-bit (i386) and 64-bit (amd64) architectures.

# Base image with platform support (default is linux/amd64)
ARG PLATFORM=linux/amd64
FROM --platform=${PLATFORM} ubuntu:20.04

# Update and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        file git curl gcc g++ make binutils vim python3 python3-pip python3-venv \
        libc6 libc6-dev gdb \
        libseccomp-dev qemu-user-static && \
    rm -rf /var/lib/apt/lists/*

# Create a Python3 virtual environment
RUN python3 -m venv /python-venv

# Activate the virtual environment and install Python dependencies
RUN . /python-venv/bin/activate && \
    pip install --upgrade pip && \
    pip install pwntools ropgadget

# Clone the pwndbg repository and set it up
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh

# Add pwndbg to gdb initialization
RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

# Set up the container to use bash by default
CMD ["/bin/bash"]