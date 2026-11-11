{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let

  in
  {
    nixosConfigurations.nixos-seashellVM = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/seashellVM/configuration.nix
        inputs.home-manager.nixosModules.default
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.aquanull = import ./modules/home-manager/home.nix;
	}
	./modules/nixos/main-user.nix
      ];
    };
#    homeConfiguration.aquanull = inputs.home-manager.lib.homeManagerConfiguration {
#      pkgs = inputs.nixpkgs.lagacyPackages.x86_64-linux;
#      modules = [ ./hosts/seashellVM/home.nix ];
 #   };
  };
}
