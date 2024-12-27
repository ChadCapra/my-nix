{
	description = "Home Manager configuration for my development machine";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };

		# User Variables
		userSettings = {
			username = "chadcapra";
			email = "chadcapra@gmail.com";
			fullName = "Chad Capra";
		};
	in {
		homeConfigurations = {
			myUser = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;

				modules = [ ./home.nix ];

				extraSpecialArgs = {
					inherit userSettings;
					inherit inputs;
				};
			};
		};
	};
}

