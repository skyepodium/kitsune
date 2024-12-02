# Kitsune
### 🚀 **Docker 기반 Pwn 환경, 키츠네!**
<img src="./kitsune.webp" style="width: 350px" alt="Kitsune Logo">  


# Kitsune의 목표
Kitsune는 다양한 아키텍처에서 바이너리 분석과 익스플로잇 테스트를 쉽게 수행할 수 있도록 설계된 환경입니다. Docker의 플랫폼 독립성을 활용하여 ARM 및 x86 기반 시스템에서도 손쉽게 설정하고 실행할 수 있습니다.


## 주요 툴
- ubuntu:20.04 - OS
- [Pwntools](https://github.com/Gallopsled/pwntools) - 익스플로잇 작성 라이브러리
- [ROPgadget](https://github.com/JonathanSalwan/ROPgadget) - ROP 가젯 찾기 도구
- [Pwndbg](https://github.com/pwndbg/pwndbg) - GDB 디버거 확장

## 지원 아키텍처
- **64-bit (x86_64)**: 현대적인 64비트 환경
- **32-bit (x86)**: 레거시 32비트 환경


## 빌드 및 실행 방법

### 1. `x86_64` (64비트) 환경
#### ARM 기반 (예: Mac M1/M2)
**빌드**
```
docker build -t pwn-amd64 --platform=linux/arm64 -f -build-arg PLATFORM=linux/amd64 .
```

**실행**
```
docker run -it --name pwn-amd64 -v "$(pwd)":/workspace pwn-amd64-container
```

#### Intel 기반
**빌드**
```
docker build -t pwn-amd64 --build-arg PLATFORM=linux/amd64 .
```

**실행**
```
docker run -it --name pwn-amd64 -v "$(pwd)":/workspace pwn-amd64-container
```



---

### 2. `x86` (32비트) 환경
#### ARM 기반 (예: Mac M1/M2)
**빌드**
```
docker build -t pwn-x86 --platform=linux/arm64 -f --build-arg PLATFORM=linux/386 .
```

**실행**
```
docker run -it --name pwn-x86 -v "$(pwd)":/workspace pwn-x86-container
```

#### Intel 기반
**빌드**
```
docker build -t pwn-x86 --build-arg PLATFORM=linux/386 .
```

**실행**
```
docker run -it --name pwn-x86 -v "$(pwd)":/workspace pwn-x86-container
```
