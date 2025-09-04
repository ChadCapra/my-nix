{
	description = "Home Manager configuration for my development machine";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs:
	let
	  # This helper function builds a Home Manager configuration.
	  # It's a reusable template for all your machines.
	  mkHome = { system, username, fullName, email }:
		home-manager.lib.homeManagerConfiguration {
		  pkgs = import nixpkgs { inherit system; };

		  # This points to your main home.nix file, which contains
		  # all your shared configuration (packages, dotfiles, etc.).
		  modules = [ ./home.nix ];

		  # This passes machine-specific variables down into your home.nix.
		  extraSpecialArgs = {
			userSettings = {
			  inherit username fullName email;
			};
			inherit inputs;
		  };
		};
	in
	{
	  # We now define a separate output for each of your machines.
	  homeConfigurations = {

		# Configuration for your Chromebook
		"chadcapra@penguin" = mkHome {
		  system = "x86_64-linux";
		  username = "chadcapra";
		  fullName = "Chad Capra";
		  email = "chadcapra@gmail.com";
		};

		# Configuration for your NixOS PC
		"chadc@nixos" = mkHome {
		  system = "x86_64-linux";
		  username = "chadc";
		  fullName = "Chad Capra";
		  email = "chadcapra@gmail.com";
		};
	  };
	};
}

