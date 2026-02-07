{ pkgs, vars, ... }:

{
  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  
  # System configuration
  system = {
    stateVersion = 6;
    configurationRevision = null;
    primaryUser = vars.user;
  };
  
  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  # User configuration
  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
    shell = pkgs.fish;
  };
  
  # Shell configuration
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  
  # System defaults
  system.defaults = {
    dock = {
      autohide = true;
    };
    
    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
      FXEnableExtensionChangeWarning = false;
    };
  };
}
