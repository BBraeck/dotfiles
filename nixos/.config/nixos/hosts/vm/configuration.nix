{ config, pkgs, ... }:

{
  # Structural Import: This is where we will eventually list all our sub-modules
  imports = [
    ./modules/core/audio.nix
    ./modules/core/virtualization.nix
    ./modules/desktop/hyprland.nix
  ];

  # Essential System Bootloader & Networking defaults for testing
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-vm"; 
  networking.networkmanager.enable = true;

  # Set your time zone and regional locales
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";     # Or fr_BE.UTF-8 depending on your preference
    LC_MONETARY = "fr_BE.UTF-8";    # Handles Euros correctly
    LC_TIME = "fr_BE.UTF-8";        # Monday as first day of the week, 24h time
  };

  # Configure console keymap (for the text-based TTY login screen)
  console.keyMap = "be-latin1";

  # Configure windowing/compositor keymaps (for Hyprland/Wayland applications)
  services.xserver.xkb = {
    layout = "be";
    variant = "";
  };

  # Enable the Determinate Nix installer optimizations out-of-the-box
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure your primary user account
  users.users.bbrae = {  # Replace 'yourusername' with your actual username
    isNormalUser = true;
    description = "Primary Development User";
    initialPassword = "nixos";
    extraGroups = [ "networkmanager" "wheel" "docker" ]; # 'wheel' grants sudo, 'docker' allows rootless container management
  };

  # State Version Guardrail
  # This value determines the data schema version for stateful services (like databases).
  # Do NOT change this value, even if you update your system years from now.
  system.stateVersion = "26.05"; 
}
