FROM alpine:latest
LABEL maintainer="chetan@gmail.com" \
      version="1.1" \
      description="my sample docker image"

# Install build tools and dependencies
RUN apk add --no-cache \
    build-base \
    cmake \
    python3 \
    py3-pip \
    git \
    ninja \
    bash \
    g++ \
    libstdc++ \
    curl

# Upgrade pip (use --break-system-packages to avoid PEP 668 error)
RUN pip3 install --upgrade pip --break-system-packages

# Install Conan 2.x
RUN pip3 install "conan>=2.3" --break-system-packages

# Create default profile automatically
RUN conan profile detect