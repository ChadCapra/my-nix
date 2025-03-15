{ userSettings, pkgs, ... }:

{

	imports = [
		./nixvim/init.nix
	];

	programs.carapace.enable = true;
	programs.fd.enable = true;
	programs.fzf.enable = true;
	programs.ripgrep.enable = true;
	programs.tmux.enable = true;
	programs.zoxide.enable = true;

	programs.git = {
		enable = true;
		userName = userSettings.fullName;
		userEmail = userSettings.email;
	};

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

			let $config = {
				filesize_metric: false
				table_mode: rounded
				use_ls_colors: true
			}
		'';
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;

# Left side: Directory + Prompt
			format = "$directory$character";

# Right side: Git, environment info, execution time, and timestamp
			right_format = "$git_branch$git_status$nodejs$elixir$cmd_duration$time";

# Directory: Show full path from home (~)
			directory = {
				truncation_length = 0;
				truncation_symbol = "…/";
				home_symbol = "~";
				style = "blue";
			};

# Git info: Branch + status
			git_branch = {
				symbol = " ";
				format = " [$symbol$branch]($style)";
				style = "bold purple";
			};
			git_status = {
				format = "(\\[$all_status$ahead_behind\\]$style)";
				style = "bold yellow";
				conflicted = "⚠️";
				ahead = "⇡";
				behind = "⇣";
				diverged = "⇕";
				untracked = "🆕";
				stashed = "📦";
				modified = "✏️";
				staged = "✔";
				renamed = "➡";
				deleted = "❌";
			};

# Programming environment (only show if relevant)
			nodejs = { format = " [📦 $version]($style)"; style = "bold green"; };
			elixir = { format = " [💜 $version]($style)"; style = "bold magenta"; };

# Execution time of last command
			cmd_duration = {
				format = " ⏱ $duration";
				style = "yellow";
				show_milliseconds = true;
				min_time = 0;
			};

# Timestamp of when last command finished
			time = {
				format = " 🕒 [$time]($style)";
				style = "bold cyan";
				disabled = false;
			};
		};
	};

	home.packages = with pkgs; [
		tldr
		nodejs
	];

# Set default shell to nushell and auto load on start (even on chromebook vm)
	home.sessionVariables = {
		SHELL = "${pkgs.nushell}/bin/nu";
	};

	home.file.".bash_profile".text = ''
		export SHELL=${pkgs.nushell}/bin/nu
		exec ${pkgs.nushell}/bin/nu
	'';

}
