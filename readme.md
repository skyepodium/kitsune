# kitsune
### 도커 컨테이너 기반 pwn 환경
<img src="./kitsune.webp" style="width: 300px">



## 툴
- [Pwntools](https://github.com/Gallopsled/pwntools)
- [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
- [Pwndbg](https://github.com/pwndbg/pwndbg)

## 지원 아키텍쳐
- **64-bit (x86_64)**
- **32-bit (x86)**

## 빌드 및 실행

### 1. Build and Run for x86_64
#### ARM
 build
```
docker build -t pwn-amd64 --platform=linux/arm64 -f -build-arg PLATFORM=linux/amd64 .
```

run
```
docker run -it --name pwn-amd64 -v "$(pwd)":/workspace pwn-amd64-container
```

#### Intel
build
```
docker build -t pwn-amd64 --build-arg PLATFORM=linux/amd64 .
```

run
```
docker run -it --name pwn-amd64 -v "$(pwd)":/workspace pwn-amd64-container
```




### 2. Build and Run for x86
#### ARM
build
```
docker build -t pwn-x86 --platform=linux/arm64 -f --build-arg PLATFORM=linux/386 .
```

run
```
docker run -it --name pwn-x86 -v "$(pwd)":/workspace pwn-x86-container
```

#### Intel
build
```
docker build -t pwn-x86 --build-arg PLATFORM=linux/386 .
```

run
```
docker run -it --name pwn-x86 -v "$(pwd)":/workspace pwn-x86-container
```

