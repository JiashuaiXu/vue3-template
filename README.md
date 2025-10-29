# Vue 3 + Vite + Nix + Podman Template

<p align="center">
  <img src="https://img.shields.io/badge/Vue.js-3.4-4FC08D?logo=vue.js&logoColor=white" alt="Vue.js">
  <img src="https://img.shields.io/badge/Vite-5-646CFF?logo=vite&logoColor=white" alt="Vite">
  <img src="https://img.shields.io/badge/Nix-2.18-0175C2?logo=nixos&logoColor=white" alt="Nix">
  <img src="https://img.shields.io/badge/Podman-4.9-892CA0?logo=docker&logoColor=white" alt="Podman">
  <img src="https://img.shields.io/badge/pnpm-9-FF69B4?logo=pnpm&logoColor=white" alt="pnpm">
</p>

<p align="center">
  <strong>A modern, reproducible development environment for Vue 3 projects</strong>
</p>

<p align="center">
  🌱 Quick project setup with Nix flakes<br>
  🐳 Containerized builds with Podman<br>
  📦 Fast dependency management with pnpm<br>
  ✅ Conventional Commits enforced<br>
  🎯 Zero-config development with Vite
</p>

## 🚀 Quick Start

### Prerequisites
- [Nix](https://nixos.org/download.html) with flakes enabled
- [Podman](https://podman.io/getting-started/installation) (or Docker as fallback)

### Using the Template

1. **Clone this repository**:
   ```bash
   git clone https://github.com/your-username/vue3-nix-podman-template.git my-project
   cd my-project
   ```

2. **Enter the Nix development environment**:
   ```bash
   nix develop
   ```
   
   You'll see a welcome message with project information and a cow saying hello!

3. **Create a new project from the template**:
   ```bash
   ./create-project.sh my-awesome-app
   cd my-awesome-app
   ```

4. **Start the development server**:
   ```bash
   pnpm dev
   ```

5. **Open your browser to [http://localhost:5173](http://localhost:5173)**

## 🛠️ Development Features

### Nix Development Environment
This project uses Nix flakes to ensure a reproducible development environment. When you run `nix develop`, you get:
- Node.js 22 (or latest available)
- pnpm package manager
- Git with conventional commit hooks
- Podman for containerization
- cowsay for fun welcome messages

### Conventional Commits
All commits are automatically validated against [Conventional Commits](https://www.conventionalcommits.org/) specification:
- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes (white-space, formatting, etc)
- `refactor`: Code changes that neither fix a bug nor add a feature
- `test`: Adding missing tests or correcting existing tests
- `chore`: Other changes that don't modify src or test files
- `qwen`: AI-assisted development (custom type)

### Code Quality
- ESLint for code linting
- Prettier for code formatting
- Pre-commit hooks to enforce code quality
- Automatic linting and formatting on commit

## 🐳 Containerized Deployment

### Building with Podman
```bash
# Build and run the container
./build-container.sh my-app

# Or run manually:
pnpm build
podman build -f podman/Containerfile -t my-app .
podman run -p 8080:80 my-app
```

The container uses:
- Multi-stage build for optimized image size
- Alpine Linux base image
- Nginx to serve the static assets
- Proper handling of Vue Router history mode

## 📁 Project Structure

```
vue3-nix-podman-template/
├── flake.nix           # Nix development environment
├── template/           # Vue 3 + Vite template
│   ├── package.json    # Project dependencies and scripts
│   ├── src/           # Source code
│   ├── public/        # Static assets
│   ├── .husky/        # Git hooks
│   ├── commitlint.config.js
│   └── podman/        # Container configuration
├── create-project.sh  # Project creation script
├── build-container.sh # Container build script
└── README.md
```

## 🤖 AI-Assisted Development

This template was created with the help of Qwen AI. The `docs(qwen)` commit type has been added specifically for AI-assisted development changes. The `qwen.md` file in the template directory tracks AI-assisted development sessions.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes with descriptive commit messages following conventional commits
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT