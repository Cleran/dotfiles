{config, pkgs,...}:
{
programs.starship = {
	enable = true;
	enableBashIntegration = true;
	settings = (builtins.fromTOML (builtins.readFile ./nerdfont_icons.toml));
};
}
