{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    plugins = [
    ];
    shortcut = "space";
    terminal = "xterm-256color";
  };
}
