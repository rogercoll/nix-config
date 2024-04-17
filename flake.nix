{
  description = "Home Manager configuration of neck";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs : let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        carbon = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = {inherit inputs outputs;};
         modules = [
	  ./hosts/desktop/carbon/configuration.nix
         ];
       };
        lled = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = {inherit inputs outputs;};
         modules = [
	  ./hosts/desktop/lled/configuration.nix
         ];
       };
      };
      homeConfigurations."neck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home-manager/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
