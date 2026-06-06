{ config, pkgs, ... }:

{
  # Make container-management CLI utilities available globally
  environment.systemPackages = with pkgs; [
    docker
    podman
  ];

  home.packages = with pkgs; [
    dtop
    lazydocker
  ];

  containerization = {
    docker = {
      enable = true;
      # Automatically purges unused container networks and images weekly to maintain a minimal system
      autoPrune.enable = true;
    };

    podman = {
      enable = true;
      # Creates an alias linking 'docker' commands to podman when docker daemon isn't targeted
      dockerCompat = false; # Set to false since you want both explicitly isolated
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}