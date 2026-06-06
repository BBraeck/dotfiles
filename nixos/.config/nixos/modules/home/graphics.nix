{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    imagemagick         # Command-line image manipulation tool
    inkscape            # Vector graphics editor
  ];
}