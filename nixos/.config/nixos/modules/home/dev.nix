{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Astral Python Engineering Ecosystem
    uv                 # Fast Python packaging engine
    ruff               # Super-fast Linter/Formatter
    ty                 # Super-fast type checker
    vscode             # VSCode CLI for remote development and extension management
  ];

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
