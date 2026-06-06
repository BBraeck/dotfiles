{ config, pkgs, ... }:

{
  # Structural Import: This is where we will eventually list all our sub-modules
  imports = [
    ../common.nix
    ../../modules/core/audio.nix
    ../../modules/core/containarization.nix
    ../../modules/profiles/hyprland.nix
  ];

  networking.hostName = "nixos-vm"; 

  # Configure windowing/compositor keymaps (for Hyprland/Wayland applications)
  services.xserver.xkb = {
    layout = "be";
    variant = "";
  };

  # Configure your primary user account
  users.users.bbrae = {
    isNormalUser = true;
    description = "Bertrand";
    initialPassword = "temp";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # State Version Guardrail
  system.stateVersion = "26.05"; 
}
