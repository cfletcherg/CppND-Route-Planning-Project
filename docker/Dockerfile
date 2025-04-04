# ===== Stage 1: Build and Install IO2D (P0267_RefImpl) =====
FROM ubuntu:20.04 AS io2d-builder

LABEL maintainer="Fletcher Garrison <f.garrison4@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y build-essential cmake libcairo2-dev libgraphicsmagick1-dev libpng-dev git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone --recurse-submodules https://github.com/cpp-io2d/P0267_RefImpl.git

WORKDIR /tmp/P0267_RefImpl
RUN sed -i '/add_subdirectory(Tests)/d' CMakeLists.txt

RUN mkdir Debug && cd Debug && \
    cmake -DCMAKE_BUILD_TYPE=Debug .. && \
    cmake --build . --target install

# ===== Stage 2: Set Up the Development Environment =====
FROM ubuntu:20.04

LABEL maintainer="Fletcher Garrison <f.garrison4@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y build-essential cmake libcairo2-dev libgraphicsmagick1-dev libpng-dev git bash xauth x11-apps bash-completion && \
    rm -rf /var/lib/apt/lists/*

RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc && \
    echo "if [ -f /usr/share/bash-completion/bash_completion ]; then . /usr/share/bash-completion/bash_completion; fi" >> /root/.bashrc && \
    echo "export PS1='\[\033[01;32m\]\u@\h:\w\$ \[\033[00m\] '" >> /root/.bashrc

COPY --from=io2d-builder /usr/local /usr/local

RUN ldconfig

WORKDIR /workspace

CMD ["/bin/bash"]
