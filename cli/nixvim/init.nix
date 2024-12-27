{ inputs, ... }:

{

	programs.nixvim.enable = true;

	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./mappings.nix
		./options.nix
		./plugins.nix
	];

}

