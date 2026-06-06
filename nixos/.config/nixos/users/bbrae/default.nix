{ config, pkgs, ... }:

{
  home.username = "bbrae";
  home.homeDirectory = "/home/bbrae";

  # Lock state compatibility
  home.stateVersion = "26.05";
}