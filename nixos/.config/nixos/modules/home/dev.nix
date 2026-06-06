{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core Infrastructure
    gnumake
    openssh

    # Lightweight Text Editing 
    gnome-text-editor  # Your chosen fast GUI editor
    vim
    nano

    # Astral Python Engineering Ecosystem
    uv                 # Fast Python packaging engine
    ruff               # Super-fast Linter/Formatter
    ty                 # Super-fast type checker
  ];

  # Declarative Git Profile Configuration
  programs.git = {
    enable = true;
    userName = "Your Name";       # Adjust to your actual identity profile
    userEmail = "your@email.com";
  };

  # Declarative Neovim Engine Setup
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Configures nvim as the system fallback $EDITOR
  };

  # Declarative VSCode Engine Setup
  programs.vscode = {
    enable = true;
    # Clean injection pattern for extensions (prevents imperative marketplace clutter)
    extensions = with pkgs.vscode-extensions; [
      charliermarsh.ruff   # Native Astral Ruff IDE integration
      ms-python.python     # Standard Python interpreter support
      astral-sh.ty         # Ty extension
      ms-vscode-remote.remote-containers # Remote dev containers
      Continue.continue    # Continue
      tamasfe.even-better-toml # toml rendering
    ];
  };
}
