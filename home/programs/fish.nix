{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      v = "nvim";
      vim = "nvim";
    };

    shellInit = ''
      fish_add_path $HOMEBREW_PREFIX/opt/make/libexec/gnubin/
    '';
  };
}
