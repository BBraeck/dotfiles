{ config, pkgs, ... }:

{
  # User-specific package profile injection
  home.packages = with pkgs; [
    # Browsers
    brave
    firefox

    # Document & Office Suites
    wps-office
    evince             # PDF viewer

    # Media Pipeline (Your chosen layout)
    loupe              # Modern GTK4 image viewer
    mpv                # High-performance minimalist video player
    amberol            # Beautifully clean music player

    # File Management & Monitoring
    nautilus           # Graphical File Manager
    btop               # Real-time System Monitor
  ];

  # Enable Yazi file manager cleanly via Home Manager
  programs.yazi = {
    enable = true;
    enableZshIntegration = true; # Changes shell directory automatically when exiting yazi
  };
}
