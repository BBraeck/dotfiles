{ config, pkgs, ... }:

{
  # 1. Enable the specialized Hyprland system module
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Support legacy applications that don't natively understand Wayland
  };

  # 2. Environment variables to tell modern toolkit engines (GTK/Qt) to run natively in Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Forces Chromium apps (Brave, VSCode) to use native Wayland
    MOZ_ENABLE_WAYLAND = "1"; # Forces Firefox to use native Wayland
  };

  # 3. Dedicated System Packages for your Hyprland ecosystem
  environment.systemPackages = with pkgs; [
    # Navigation & Core Desktop
    waybar
    walker
    kitty
    
    wl-clipboard       # Fixed system clipboard bridging for terminal <-> GUI
    hyprland-protocols  # Wayland extension protocols for performance
    lxqt.lxqt-policykit # Polkit authentication agent for GUI password popups (Docker/VSCode)
  ];

  # Security prerequisite: enables the portal system so apps can share windows/screens
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
