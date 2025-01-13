{ ... }:

{
    programs.nixvim = {

        colorschemes.cyberdream.enable = true;

        globals.mapleader = " ";

		# Set 'vi' and 'vim' aliases to nixvim
		viAlias = true;
		vimAlias = true;

		# Setup clipboard support
		clipboard = {
			# Use xsel as clipboard provider
			providers.xsel.enable = true;

			# Sync system clipboard
			register = "unnamedplus";
		};

        opts = {
            number = true;
            relativenumber = true;
            tabstop = 4;
            shiftwidth = 4;
            expandtab = false;
            smartindent = true;
		};

    };

}

