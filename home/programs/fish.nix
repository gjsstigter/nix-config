{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      # System
#      ls = "ls -lah";
#      ".." = "cd ..";
#      "..." = "cd ../..";

      # Nix
      nrs = "darwin-rebuild switch --flake .";
      nrb = "darwin-rebuild build --flake .";
      nfu = "nix flake update";

      # Git shortcuts
#      g = "git";
#      gs = "git status";
#      gd = "git diff";
#      ga = "git add";
#      gc = "git commit";
#      gp = "git push";
#      gl = "git pull";

      # Editor
      v = "nvim";
      vim = "nvim";
    };

#    shellInit = ''
#      # Disable greeting
#      set fish_greeting
#
#      # Set colors
#      set -g fish_color_command green
#      set -g fish_color_error red
#      set -g fish_color_param cyan
#    '';

    functions = {
      # Custom function to create and enter directory
      mkcd = {
        description = "Create a directory and cd into it";
        body = ''
          mkdir -p $argv[1]
          cd $argv[1]
        '';
      };

      # Extract various archive types
      extract = {
        description = "Extract various archive types";
        body = ''
          if test -f $argv[1]
            switch $argv[1]
              case "*.tar.bz2"
                tar xjf $argv[1]
              case "*.tar.gz"
                tar xzf $argv[1]
              case "*.bz2"
                bunzip2 $argv[1]
              case "*.gz"
                gunzip $argv[1]
              case "*.tar"
                tar xf $argv[1]
              case "*.zip"
                unzip $argv[1]
              case "*.Z"
                uncompress $argv[1]
              case "*"
                echo "'$argv[1]' cannot be extracted"
            end
          else
            echo "'$argv[1]' is not a valid file"
          end
        '';
      };

      # Git commit with message
      gcm = {
        description = "Git commit with message";
        body = ''
          git commit -m "$argv"
        '';
      };
    };

    interactiveShellInit = ''
      # Bind ctrl+f to accept autosuggestion
      bind \cf forward-char

      # Bind ctrl+e to edit command in editor
      bind \ce edit_command_buffer
    '';
  };
}
