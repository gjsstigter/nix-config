{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nixpkgs-darwin = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs-darwin";
        };
      };
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };

    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs =
    { ... }@inputs:
      with inputs;
      let
        inherit (self) outputs;

        stateVersion = "24.05";
        libx = import ./lib { inherit inputs outputs stateVersion; };
      in
      {
        formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;

        darwinConfigurations = {
          ymir = libx.mkDarwin { hostname = "ymir"; };
        };

        colmena = {
          meta = {
            nixpkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
            specialArgs = {
              inherit
                inputs
                outputs
                stateVersion
                self
                ;
            };
          };

          default =
            { lib
            , config
            , name
            , ...
            }:
            {
              imports = [
                inputs.home-manager.nixosModules.home-manager
              ];
            };
        };
      };
}
