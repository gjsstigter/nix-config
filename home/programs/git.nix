{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Stèlios Stigter";
        email = "sstigter@tilaa.com";
        signingkey = "~/.ssh/id_rsa.pub";
      };

      core = {
        editor = "nvim";
        autocrlf = "input";
      };

      color = {
        ui = true;
      };

      alias = {
        ls = "log --pretty=format\:\"\%C(yellow)\%h\%Cred\%d\\ \%Creset\%s\%Cblue\\ [\%an]\" --decorate";
      };

      push = {
        default = "upstream";
        autoSetupRemote = true;
      };

      pull = {
        rebase = true;
      };

      rebase = {
        autoStash = true;
      };

      rerere = {
        enabled = true;
      };

      init = {
        templatedir = "~/.config/git/templates";
        defaultBranch = "main";
      };

      commit = {
        gpgsign = true;
      };

      gpg = {
        format = "ssh";
      };

      log = {
        follow = true;
      };

    };

    # Git ignore patterns
    ignores = [
      ".DS_Store"
      "*.swp"
      "*.swo"
      "*~"
      ".idea/"
      "*.iml"
      ".vscode/"
      "node_modules/"
      ".env"
      ".direnv/"
    ];
  };
  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      light = false;
      side-by-side = true;
      line-numbers = true;
    };
  };
}
