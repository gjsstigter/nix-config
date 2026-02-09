{ config, pkgs, ... }:

let
  catppuccin-ghostty = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "ghostty";
    rev = "main";
    sha256 = "sha256-Y6RFften1/6+1xdhIzEh/E7FBJTwY5a8NH4301HbgOM=";
  };
in
{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    enableFishIntegration = true;
    settings = {
      theme = "catppuccin-mocha.conf";
      font-family = "JetBrains Mono";
      font-size = 13;
      window-padding-x = 10;
      window-padding-y = 10;
      # Add other settings here
    };
  };
  home.file.".config/ghostty/themes" = {
    source = "${catppuccin-ghostty}/themes";
    recursive = true;
  };
}
