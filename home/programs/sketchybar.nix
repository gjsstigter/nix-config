{ config, pkgs, ... }:

{
  programs.sketchybar = {
    enable = false;

    package = pkgs.sketchybar;

    extraPackages = [ pkgs.jq pkgs.sketchybar-app-font ];
    config = ''
      sketchybar --bar height=32 position=top color=0xff1e1e2e
      sketchybar --default icon.font="SF Pro:Bold:14.0"
      sketchybar --add item clock right \
                 --set clock script="date '+%H:%M'" update_freq=10
      sketchybar --update
    '';
  };
}