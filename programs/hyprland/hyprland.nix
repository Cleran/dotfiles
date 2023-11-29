{ config, pkgs, lib, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		extraConfig = builtins.readFile ./hyprland.conf;
		systemd.enable = true;
	};

  programs.waybar ={
	enable = true;
	systemd.enable = true;
	systemd.target = "hyprland-session.target";
	
#	style = ./waybar/style.css;
	#settings = builtins.fromJSON (builtins.readFile ./waybar/config);
	settings = {
		MainBar = {
			layer = "top";
			position = "top";
			modules-left = [ "hyprland/workspaces" ];
			modules-center = [ "hyprland/window" ];
			modules-right = [ "clock" ];
			"hyprland/workspaces" = {
				format = "{icon}";
				persistent-workspaces = {
					"*" = 5;
				};
			};
		};
	};
  };

	xdg.configFile."waybar/style.css".source = ./waybar/style.css;
#	xdg.configFile."waybar/config".source = ./waybar/config;


	services.dunst = {
		enable = true;
	};

	home.packages = with pkgs; [
		libnotify # for dunst

		libsForQt5.polkit-kde-agent # authentication agent
	];	

}
