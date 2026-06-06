{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Essential CLI utilities
    openssh
    gnumake
    htop
    btop
    tree
    curl
    wget
    unzip
    gnutar
    rsync

    # Terminal-based text editors
    nano
    vim
  ];

  # Enable Yazi file manager cleanly via Home Manager
  programs.yazi = {
    enable = true;
    enableZshIntegration = true; # Changes shell directory automatically when exiting yazi
  };

  # Declarative Git Profile Configuration
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "braeckeveldt";
        email = "bertrandbraeckeveldt@gmail.com";
      };
    };
  };

  # Declarative Neovim Engine Setup
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

}