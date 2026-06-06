{ config, pkgs, ... }:

{
  # 1. Enable the X11 Display Server (Prerequisite layer for SDDM)
  services.xserver.enable = true;

  # 2. Enable the Display Manager (Login Screen)
  # SDDM is the native, recommended login manager for KDE Plasma
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Run the login screen natively under Wayland
  };

  # 3. Enable the KDE Plasma Desktop Environment Module
  services.desktopManager.plasma6.enable = true;

  # 4. Integrate KDE Specific Utilities and Apps
  environment.systemPackages = with pkgs; [
    # Terminal
    # You requested a terminal: Konsole is KDE's ultra-powerful native terminal.
    # However, since your shared user profile relies on Kitty, we will include Konsole 
    # as a system fallback, but Kitty will run flawlessly here too!
    kdePackages.konsole
    
    # Core Utilities bundled out of preference
    kdePackages.spectacle  # Screenshot utility
    kdePackages.ark        # Archive manager (.zip, .tar.gz)
  ];

  # 5. Native Integration Guardrails
  # This ensures GTK applications (like Brave or Firefox) blend in visually 
  # with KDE's default Qt theme/styling.
  programs.dconf.enable = true;
}