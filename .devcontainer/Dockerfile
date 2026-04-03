FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install system packages
RUN apt-get update && apt-get install -y \
    tmux \
    vim \
    neovim \
    ncurses-dev \
    libncurses5-dev \
    libncursesw5-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install LazyVim
RUN git clone https://github.com/LazyVim/starter /root/.config/nvim && \
    rm -rf /root/.config/nvim/.git

# Install mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/mise

# Activate mise + vi mode in shells
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'set -o vi' >> /home/vscode/.bashrc && \
    echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc && \
    echo 'set -o vi' >> /home/vscode/.zshrc
