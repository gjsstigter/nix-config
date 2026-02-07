{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "Stèlios Stigter";
        email = "sstigter@tilaa.com";
      };

      color = {
        ui = true;
      };

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "log --graph --oneline --all";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };
      
      pull = {
        default = "upstream";
      };

    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      


      merge = {
        conflictstyle = "diff3";
      };
      
      diff = {
        colorMoved = "default";
      };
      
      # Better diffs
      rerere.enabled = true;
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
    
    # Delta for better diffs (optional)
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };
  };
}
