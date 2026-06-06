{ config, pkgs, ... }:

{
  # Structural Import: This is where we will eventually list all our sub-modules
  imports = [
    ../common.nix
    ../../modules/core/audio.nix
    ../../modules/core/containerization.nix
    ../../modules/profiles/kde.nix
  ];

  networking.hostName = "nixos-vm";

  users.users.bbrae = {
    isNormalUser = true;
    description = "Bertrand";
    initialPassword = "nixos";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  system.stateVersion = "26.05";
}
