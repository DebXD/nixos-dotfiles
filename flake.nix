{
  description  = "my first flake";
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
      home-mananger.url = "github:nix-community/home-manager/release-23.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
   };
  outputs = { self, nixpkgs, home-manager, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
      nixosConfigurations = {
        debxd-tux = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ./nvidia.nix];
        };
        };
        homeConfigurations = {
         debxd = home-manager.lib.homeManagerConfiguration{
           inherit pkgs;
          modules = [ ./home.nix];
        };

        };
    };
}
