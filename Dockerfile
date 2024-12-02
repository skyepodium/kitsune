# name: ubuntu-pwn-x86_64
# description: Dockerfile for a pwning environment supporting 64-bit x86_64 (amd64) architecture.

# Base image is set to Ubuntu 20.04 for x86_64 (64-bit) architecture
FROM --platform=linux/amd64 ubuntu:20.04

# Update and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        file git curl gcc g++ make binutils vim python3 python3-pip python3-venv \
        libc6 libc6-dev gdb \
        libseccomp-dev qemu-user-static && \
    rm -rf /var/lib/apt/lists/*

# Create a Python3 virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Python dependencies
RUN . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install pwntools ropgadget

# Clone the pwndbg repository and set it up
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh

# Add pwndbg to gdb initialization
RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

# Set up the container to use bash by default
CMD ["/bin/bash"]