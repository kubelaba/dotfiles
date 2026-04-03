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

# Install mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/mise

# Install DevPod
RUN curl -L -o /usr/local/bin/devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && \
    chmod +x /usr/local/bin/devpod

# Set default shell to zsh
RUN chsh -s $(which zsh) vscode

# Activate mise + vi mode in shells
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'set -o vi' >> /home/vscode/.bashrc && \
    echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc && \
    echo 'set -o vi' >> /home/vscode/.zshrc

# Trust mise configs
RUN mkdir -p /root/.config/mise && \
    echo '[settings]\nparanoid = false' > /root/.config/mise/config.toml && \
    mkdir -p /home/vscode/.config/mise && \
    echo '[settings]\nparanoid = false' > /home/vscode/.config/mise/config.toml
