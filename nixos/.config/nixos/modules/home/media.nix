{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    amberol            # Beautifully clean music player
    mpv                # High-performance minimalist video player
    loupe              # Modern GTK4 image viewer
    easyeffects        # Advanced audio effects processor for system-wide sound enhancement
    ffmpeg             # Essential multimedia framework for encoding/decoding
  ];
}