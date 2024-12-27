{ ... }:

{
	programs.nixvim.keymaps = [
		{ key = "<leader>ff"; action = ":Telescope find_files<CR>"; mode = "n"; }
		{ key = "<leader>fg"; action = ":Telescope live_grep<CR>"; mode = "n"; }
	];
}

