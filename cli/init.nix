{ userSettings, pkgs, ... }:

{
  # Install CLI programs
  programs.bat.enable = true;
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

  # Enable the programs, but configure them with dotfiles
  programs.neovim = {
    enable = true;
    # Create aliases for vi and vim
    viAlias = true;
    vimAlias = true;
  };

  programs.starship.enable = true;

  # Install packages needed by our configs (e.g., for neovim clipboard)
  home.packages = with pkgs; [
    tldr
    nodejs
    xsel # For neovim clipboard
	nushell
  ];

  # --- DOTFILE MANAGEMENT ---
  # This section links the files from our `dotfiles` directory
  # into the correct locations in the user's home directory.

  # Neovim: Recursively link the entire nvim config directory
  home.file.".config/nvim" = {
    source = ../dotfiles/nvim;
    recursive = true;
  };

  # Nushell: Link the two config files
  home.file.".config/nushell/config.nu".source = ../dotfiles/nushell/config.nu;
  home.file.".config/nushell/env.nu".source = ../dotfiles/nushell/env.nu;

  # Starship
  home.file.".config/starship.toml".source = ../dotfiles/starship.toml;

  # Tmux
  home.file.".tmux.conf".source = ../dotfiles/tmux.conf;


  # --- SHELL SETUP ---
  # Set default shell to nushell and auto load on start (even on chromebook vm)
  home.sessionVariables = {
    SHELL = "${pkgs.nushell}/bin/nu";
  };

  home.file.".bash_profile".text = ''
    export SHELL=${pkgs.nushell}/bin/nu
    exec ${pkgs.nushell}/bin/nu
  '';
}
