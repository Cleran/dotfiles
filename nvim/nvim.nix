{config, pkgs,...}:
{
programs.neovim = {
	enable = true;
	defaultEditor = true;	

	#set aliases
	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

	withPython3 = true;
	
	extraLuaConfig = builtins.readFile ./options.lua;
	
	plugins = with pkgs.vimPlugins;
	[
		{
			plugin = nvim-lspconfig;
			type = "lua";
			config = builtins.readFile ./plugin/lsp.lua;
		}

		{
			plugin = (nvim-treesitter.withPlugins (p:[
				p.tree-sitter-nix	
 				p.tree-sitter-lua
				p.tree-sitter-vim
				p.tree-sitter-bash
				p.tree-sitter-python
				p.tree-sitter-json
			]));
			type = "lua";
			config = builtins.readFile ./plugin/treesitter.lua;
		}
		
		{
			plugin = catppuccin-nvim;
			config = "colorscheme catppuccin-macchiato";
		}

		cmp_luasnip
		cmp-nvim-lsp

		luasnip
		friendly-snippets
		{
			plugin = nvim-cmp;
			type = "lua";
			config = builtins.readFile ./plugin/cmp.lua;
		}

		# nvim-web-devicons
		{
			plugin = nvim-tree-lua;
			type = "lua";
			config = builtins.readFile ./plugin/tree.lua;
		}

	];

	extraPackages = with pkgs; [
		# lsp
		nixd
		lua-language-server


		wl-clipboard # enables copy/pasting from nvim
		wl-clipboard-x11
	];
};}
