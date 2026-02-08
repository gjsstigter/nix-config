{ config, pkgs, ... }:

{
  programs.neovim = {
  enable = true;
  extraPackages = with pkgs; [
        # LazyVim
        lua-language-server
        stylua
        # Telescope
        ripgrep
      ];

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];
  };
}
