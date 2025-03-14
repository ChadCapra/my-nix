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

	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			format = "$hostname$directory$git_branch$character";  # Custom prompt format
				directory = {
					truncation_length = 3;  # Only show the last 3 directories
					style = "bold yellow";
				};
			git_branch = {
				format = "[$symbol$branch]($style) ";  # Make Git branch more visible
				symbol = "🌱 ";  # Change Git branch symbol
			};
			character = {
				success_symbol = "[➜](bold green) ";  # Green arrow for success
				error_symbol = "[✗](bold red) ";  # Red X for errors
			};
		};
	};

	home.packages = with pkgs; [
		tldr
		nodejs
	];

}
