{ userSettings, pkgs, ... }:

{

	imports = [
		./nixvim/init.nix
	];

	programs.tmux.enable = true;

	programs.git = {
		enable = true;
		userName = userSettings.fullName;
		userEmail = userSettings.email;
	};

	programs.ripgrep.enable = true;

	programs.btop = {
		enable = true;
		settings = {
			color_theme = "Default";
			theme_background = false;
		};
	};

	programs.nushell = {
		enable = true;
		configFile.text = ''
			alias ll = ls -l
			alias gs = git status
			'';
	};

	home.packages = with pkgs; [
		tldr
	];

}
