{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-master,
    home-manager,
    nvf
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
    pkgs-master = import nixpkgs-master {
        inherit system;
        config.allowUnfree = true;
      };

  in {
    nixosConfigurations = {
      cybertractor = lib.nixosSystem {
        specialArgs = {inherit inputs system nixpkgs pkgs-master;};
        modules = [
          ./configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
  };
}
