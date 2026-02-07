{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    vim
    neovim
    
    # IDEs
    jetbrains.phpstorm
    vscodium
    
    # Terminal utilities
    tmux
    fish
    direnv
    
    # Development tools
    nixfmt
    nixfmt-tree
    
    # Applications
    slack
    firefox
    orbstack
    
    # System utilities
    mkalias
    defaultbrowser
  ];
}
