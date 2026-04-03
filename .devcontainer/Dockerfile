FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install mise via binary copy (works on Ubuntu 24.04 - has GLIBC 2.39)
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/mise

# Activate mise + enable vi mode in both shells
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'set -o vi' >> /home/vscode/.bashrc && \
    echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc && \
    echo 'set -o vi' >> /home/vscode/.zshrc
