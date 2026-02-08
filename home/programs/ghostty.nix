{ config, pkgs, ... }:

{
  programs.ghostty = {
  enable = true;
  package = null;  # Don't install via nix, use brew version
  settings = {
    theme = "catppuccin-mocha";
    font-family = "JetBrains Mono";
    font-size = 13;
    window-padding-x = 10;
    window-padding-y = 10;
    # Add other settings here
  };
    };
}
