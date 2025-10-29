#!/usr/bin/env bash

# build-container.sh - Script to build and run the Vue 3 app with Podman

set -e

PROJECT_NAME=${1:-"vue3-app"}

echo "Building Vue 3 app with Podman..."

# Build the application first
echo "Building application..."
cd template
pnpm install
pnpm build
cd ..

# Build the container image
echo "Building container image..."
podman build -f template/podman/Containerfile -t "$PROJECT_NAME" .

echo ""
echo "✅ Container image '$PROJECT_NAME' built successfully!"
echo ""
echo "🚀 To run the container:"
echo "  podman run -p 8080:80 $PROJECT_NAME"
echo ""
echo "🐳 Or with interactive mode:"
echo "  podman run -it -p 8080:80 --rm $PROJECT_NAME"
echo ""