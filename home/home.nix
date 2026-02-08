{ config
, pkgs
, vars
, ...
}:

{
  imports = [
    # Import program configurations
    # Uncomment the ones you want to use

    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/fish.nix
    # ./programs/vscodium.nix
    # ./programs/neovim.nix
  ];

  home = {
    stateVersion = "24.11";
    username = vars.user;
    homeDirectory = "/Users/${vars.user}";
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # Additional home packages (separate from system packages)
  home.packages = with pkgs; [
    # Add user-specific packages here
    # ripgrep
    # fd
    # bat
    # eza
  ];

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    # VISUAL = "code";
  };
}
