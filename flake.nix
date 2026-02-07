{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    nur.url = "github:nix-community/NUR";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      nixpkgs,
      home-manager,
      mac-app-util,
      nur,
    }:
    let
      vars = {
        user = "sstigter";
        hostname = "ymir";
        defaultbrowser = "firefox";
      };
    in
    {
      darwinConfigurations.${vars.hostname} = nix-darwin.lib.darwinSystem {
        modules = [
        {
          nixpkgs.overlays = [
            nur.overlays.default
          ];
        }
          ./modules/system.nix
          ./modules/packages.nix
          ./modules/homebrew.nix
          
          mac-app-util.darwinModules.default
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = vars.user;
              
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              
              mutableTaps = false;
              autoMigrate = true;
            };
          }
          
          (
            { config, ... }:
            {
              homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
            }
          )
          
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${vars.user} = import ./home/home.nix;
              sharedModules = [ mac-app-util.homeManagerModules.default ];
              extraSpecialArgs = { inherit vars; };
              backupFileExtension = "backup"; 
            };
          }
          
          # Pass vars to all modules
          { _module.args = { inherit vars; }; }
        ];
      };
    };
}
