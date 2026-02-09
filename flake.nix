{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
  in {
    nixosConfigurations = {
      cybertractor = lib.nixosSystem {
        specialArgs = {inherit inputs system nixpkgs;};
        modules = [
          ./configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
  };
}
