# 설명: 32비트 (i386)와 64비트 (amd64) 아키텍처를 지원하는 통합 Dockerfile.

# 플랫폼 지원 기본 베이스 이미지 (기본값은 linux/amd64)
ARG PLATFORM=linux/amd64
FROM --platform=${PLATFORM} ubuntu:20.04

# 필수 패키지 업데이트 및 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        file git curl gcc g++ make binutils vim python3 python3-pip python3-venv \
        libc6 libc6-dev gdb \
        libseccomp-dev && \
    rm -rf /var/lib/apt/lists/*

# PLATFORM이 linux/amd64일 때만 qemu-user-static 설치
RUN if [ "${PLATFORM}" = "linux/amd64" ]; then \
        apt-get update && apt-get install -y --no-install-recommends qemu-user-static; \
    fi

# Python3 가상 환경 생성
RUN python3 -m venv /python-venv

# 가상 환경 활성화 및 Python 종속성 설치
RUN . /python-venv/bin/activate && \
    pip install --upgrade pip && \
    pip install pwntools ropgadget

# pwndbg 리포지토리 복제 및 설정
RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh

# pwndbg를 gdb 초기화 파일에 추가
RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

# 기본적으로 bash 셸을 사용하도록 컨테이너 설정
CMD ["/bin/bash"]