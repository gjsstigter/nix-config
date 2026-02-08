{ config
, inputs
, pkgs
, lib
, unstablePkgs
, ...
}:
{
  home.stateVersion = "23.11";

  imports = [
    # Import program configurations
    # Uncomment the ones you want to use

    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/fish.nix
  ];
}
