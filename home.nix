{ config, pkgs, ... }:

{
  home.username = "cleran";
  home.homeDirectory = "/home/cleran";

  targets.genericLinux.enable = true;

  home.stateVersion = "23.05";

  home.packages = [

  ];

  imports = [
	./programs/nvim/nvim.nix
	./programs/starship/starship.nix
	./programs/hyprland/hyprland.nix
  ];

  programs.firefox.enable = true;

  programs.kitty = {
    enable = true;
    font = {
    	package = pkgs.fira-code-nerdfont;
    	name = "Fira Mono";
    };
    shellIntegration.enableBashIntegration = true;
	environment = {
		"LIBGL_ALWAYS_SOFTWARE" = "1";
	};
 };

  programs.tmux = {
	enable = true;
	keyMode = "vi";
	mouse = true;
  };

  programs.git = {
	enable = true;
	userName = "Cleran";
	userEmail = "cleran.brulius@gmail.com";
  };

  programs.bash = {
	enable = true;
	enableCompletion = true;
	shellAliases = {
		switch-home = "home-manager switch --flake ~/dotfiles/";
		switch-nixos = "sudo nixos-rebuild switch --flake ~/nixos-conf/";
	};
  };

  programs.wofi.enable = true;


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
	LIBGL_ALWAYS_SOFTWARE = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
