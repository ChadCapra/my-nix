{ ... }:

{
    programs.nixvim = {

        colorschemes.cyberdream.enable = true;

        globals.mapleader = " ";

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

