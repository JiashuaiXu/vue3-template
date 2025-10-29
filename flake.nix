{
  description = "Vue 3 development environment with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
        
        # Use Node.js 25 if available, otherwise use latest stable
        nodejs = pkgs.nodejs-22_x or pkgs.nodejs_latest or pkgs.nodejs;
        
        # Create a custom dev shell
        shell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs
            pnpm
            cowsay
            figlet
            git
            podman
          ];

          # Set environment variables
          NODE_ENV = "development";
          
          # Define shell hooks that run when entering the environment
          shellHook = ''
            # Automatically install Git hooks when entering Nix shell
            if [ -d "template" ]; then
              cd template
              if [ -f "package.json" ] && [ -f "node_modules/.bin/husky" ]; then
                echo "Setting up Git hooks..."
                npx husky install
              fi
              cd ..
            fi
            
            # Display welcome message with project info
            echo ""
            figlet -f small "Vue3-Nix" | head -n 5
            echo ""
            echo "🌱 Vue 3 + Vite + Nix Development Environment"
            echo "📦 Using Node.js $(node --version) and pnpm $(pnpm --version)"
            echo "🚀 Run 'cd template && pnpm install' to get started"
            echo ""
            cowsay -f tux "Welcome to your Vue 3 development environment!"
            echo ""
          '';
        };
      in
      {
        devShells.default = shell;
        
        packages.default = shell;
      });
}