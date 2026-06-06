{ config, pkgs, ... }:

{
  imports = [
    ../modules/core/common.nix
    ../home/common.nix
    ../users/bbrae/default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  # Set time zone and regional locales
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";
    LC_MONETARY = "fr_BE.UTF-8";
    LC_TIME = "fr_BE.UTF-8";
  };

  # Configure console keymap (for the text-based TTY login screen)
  console.keyMap = "be-latin1";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}