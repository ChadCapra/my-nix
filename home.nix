{ config, pkgs, userSettings, ... }:

{
	programs.home-manager.enable = true;

	imports = [
		./cli/init.nix
		./gui/init.nix
	];

	home.username = userSettings.username;
	home.homeDirectory = "/home/${userSettings.username}";

	home.stateVersion = "25.05";

}

