{ config, pkgs, lib, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		extraConfig = builtins.readFile ./hyprland.conf;
	};

  programs.waybar ={
	enable = true;
	systemd.enable = true;
	#package = (pkgs.waybar.overrideAttrs (oldAttrs: {
	#	mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	#}));
	
	style = ./waybar/style.css;
	#settings = builtins.fromJSON (builtins.readFile ./waybar/config);
	settings = {
		MainBar = {
			layer = "top";
			position = "top";
			modules-left = [ "hyprland/workspaces" ];
			modules-middle = [ "hyprland/window" ];
			modules-right = [ "clock" ];
		};
	};
  };

#	xdg.configFile."waybar/style.css".source = ./waybar/style.css;
#	xdg.configFile."waybar/config".source = ./waybar/config;
}
