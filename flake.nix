{
  description = "NixOS Konfiguration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, caelestia-shell, ... }: {
    nixosConfigurations = {

      nix-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs    = true;
            home-manager.useUserPackages  = true;
	    home-manager.extraSpecialArgs = { inherit caelestia-shell; };
            home-manager.users.micha      = import ./home/home.nix;
          }
        ];
      };

    };
  };
}
