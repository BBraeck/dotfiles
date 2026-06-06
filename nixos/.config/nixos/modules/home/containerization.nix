{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dtop
    lazydocker
  ];
}