#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nodejs pnpm git

# create-project.sh - Script to create a new Vue 3 project from this template

set -e

PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: ./create-project.sh <project-name>"
  echo "This will create a new Vue 3 project based on the Vue 3 + Vite + Nix + Podman template"
  exit 1
fi

if [ -d "$PROJECT_NAME" ]; then
  echo "Error: Directory '$PROJECT_NAME' already exists"
  exit 1
fi

echo "Creating new Vue 3 project: $PROJECT_NAME"

# Copy template files
cp -r template "$PROJECT_NAME"

# Enter project directory
cd "$PROJECT_NAME"

# Initialize git repository
git init

# Update package.json with new project name
if command -v jq >/dev/null 2>&1; then
  jq --arg name "$PROJECT_NAME" '.name = $name' package.json > package.json.tmp && mv package.json.tmp package.json
else
  echo "Warning: jq not found. Please manually update the 'name' field in package.json"
fi

# Install dependencies using pnpm
echo "Installing dependencies with pnpm..."
pnpm install

# Setup husky
echo "Setting up Git hooks..."
npx husky install

# Add all files to git
git add .

echo ""
echo "✅ Project '$PROJECT_NAME' created successfully!"
echo ""
echo "🚀 To start developing:"
echo "  cd $PROJECT_NAME"
echo "  pnpm dev"
echo ""
echo "🐳 To build and run with Podman:"
echo "  pnpm build"
echo "  podman build -f podman/Containerfile -t $PROJECT_NAME ."
echo "  podman run -p 8080:80 $PROJECT_NAME"
echo ""