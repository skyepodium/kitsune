# Use Ubuntu as base image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends file git curl gcc vim python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Clone the pwndbg repo and checkout to specified tag
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && \
    git checkout tags/2022.08.30

# Install pwndbg
RUN cd pwndbg && ./setup.sh

# Update .gdbinit to source pwndbg
RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

# Install pwntools
RUN pip3 install pwntools ropgadget

# Set up environment for interactive bash shell
CMD ["/bin/bash"]