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
    settings = {
      user = {
        name = "braeckeveldt";       # Adjust to your actual identity profile
        email = "bertrandbraeckeveldt@gmail.com";
      };
    };
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
    profiles.default.extensions = with pkgs.vscode-extensions; [
      charliermarsh.ruff   # Native Astral Ruff IDE integration
      ms-python.python     # Standard Python interpreter support
      ms-vscode-remote.remote-containers # Remote dev containers
      tamasfe.even-better-toml # toml rendering
    ];
  };
}
