{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    flameshot           # Powerful screenshot tool with annotation capabilities
    simplescreenrecorder # User-friendly screen recording application
  ];
}