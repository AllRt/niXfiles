{
  description = "A very basic flake";

  inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.05";

  };

  outputs = { self, nixpkgs }
  @inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in
  {
      nixosConfigurations = {
        cybertractor = lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
            ./configuration.nix
          ];
        };
      };
  };
}
