#!/usr/bin/env bash
set -euo pipefail

# versão padrão caso não esteja definida
QUARTO_VERSION="${QUARTO_VERSION:-1.4.550}"

QUARTO_HOME="$HOME/.quarto"
mkdir -p "$QUARTO_HOME"

echo "Downloading Quarto v${QUARTO_VERSION}..."
curl -L \
  "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" \
  -o /tmp/quarto.tar.gz

echo "Extracting Quarto..."
tar -xzf /tmp/quarto.tar.gz -C "$QUARTO_HOME" --strip-components=1

export PATH="$QUARTO_HOME/bin:$PATH"

echo "Quarto version:"
quarto --version

echo "Rendering site..."
quarto render
