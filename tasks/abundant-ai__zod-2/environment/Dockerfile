FROM ubuntu:24.04

# Base system packages (common to all languages)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    patch \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 22 (from .nvmrc)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Enable corepack for pnpm
RUN corepack enable && corepack prepare pnpm@10.12.1 --activate

WORKDIR /app

# Clone repo at HEAD commit (with fix applied)
RUN git clone https://github.com/abundant-ai/zod.git src && \
    cd src && \
    git fetch origin 890ff626fdde3402f733ec8924df400b48ccd1d9 && \
    git checkout 890ff626fdde3402f733ec8924df400b48ccd1d9 && \
    git submodule update --init --recursive

WORKDIR /app/src

# Set environment variables for CI
ENV CI=true

# Install dependencies with frozen lockfile
RUN pnpm install --frozen-lockfile

# Build the TypeScript project
RUN pnpm build

# Apply bug.patch to revert to buggy state (BASE)
COPY bug.patch /tmp/bug.patch
RUN patch -p1 < /tmp/bug.patch && rm /tmp/bug.patch

# Rebuild after patching TypeScript source
RUN pnpm build

RUN rm -rf /app/src/.git

WORKDIR /app/src
