# Use Ubuntu as base image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends file git curl gcc vim python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Create a Python3 virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install dependencies
RUN . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install pwntools ropgadget

# Clone the pwndbg repo and checkout to specified tag
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg

# Install pwndbg in the virtual environment
RUN . /opt/venv/bin/activate && cd pwndbg && ./setup.sh

# Update .gdbinit to source pwndbg
RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

# Set up environment for interactive bash shell and activate the virtual environment on container start
CMD ["/bin/bash", "-c", "source /opt/venv/bin/activate && exec bash"]
