{
  description = "Modular NixOS Configuration";

  inputs = {
    # We use the unstable channel for the latest Hyprland and developer tools (uv, ruff)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager for managing your user dotfiles, shell, and user packages
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # Forces home-manager to use our nixpkgs version
    };
  };

  # 2. Outputs: What we build with those ingredients
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      t490s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # The core entry point where our system architecture begins
          ./hosts/t490s/configuration.nix

          {
            nixpkgs.config.allowUnfree = true;
          }

          # Inject Home Manager module directly into the system configuration pipeline
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            # Map your home user modules cleanly into your actual target username
            home-manager.users.bbrae = { ... }: {
              imports = [
                ./users/bbrae/default.nix
                ./modules/home/ai.nix
                ./modules/home/browsers.nix
                ./modules/home/common.nix
                ./modules/home/containerization.nix
                ./modules/home/dev.nix
                ./modules/home/graphics.nix
                ./modules/home/media.nix
                ./modules/home/office.nix
                ./modules/home/screen.nix
                ./modules/home/shell.nix
                ./modules/home/transmission.nix
              ];
              home.stateVersion = "26.05"; # Match your system's underlying state constraint
            };
          }
        ];
      };
      # "nixos-vm" is the hostname we will use for your virtual machine testing phase
      nixos-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # The core entry point where our system architecture begins
          ./hosts/vm-test/configuration.nix

          {
            nixpkgs.config.allowUnfree = true;
          }

          # Inject Home Manager module directly into the system configuration pipeline
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            # Map your home user modules cleanly into your actual target username
            home-manager.users.bbrae = { ... }: {
              imports = [
                ./users/bbrae/default.nix
                ./modules/home/ai.nix
                ./modules/home/browsers.nix
                ./modules/home/common.nix
                ./modules/home/containerization.nix
                ./modules/home/dev.nix
                ./modules/home/graphics.nix
                ./modules/home/media.nix
                ./modules/home/office.nix
                ./modules/home/screen.nix
                ./modules/home/shell.nix
                ./modules/home/transmission.nix
              ];
              home.stateVersion = "26.05"; # Match your system's underlying state constraint
            };
          }
        ];
      };
    };
  };
}
