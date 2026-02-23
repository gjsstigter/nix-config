{ config
, inputs
, pkgs
, lib
, unstablePkgs
, ...
}:
{
  home = {
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  imports = [
    ./programs/aerospace.nix
    ./programs/firefox.nix
    ./programs/fish.nix
    ./programs/fzf.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/sketchybar.nix
    ./programs/tmux.nix
  ];
}
