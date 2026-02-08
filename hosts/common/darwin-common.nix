{ inputs
, outputs
, config
, lib
, hostname
, system
, username
, pkgs
, unstablePkgs
, ...
}:
let
  inherit (inputs) nixpkgs nixpkgs-unstable;
in
{
  users.users.sstigter.home = "/Users/sstigter";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
    channel.enable = false;
  };
  system.stateVersion = 5;

  # Set primary user for system-wide activation
  system.primaryUser = "sstigter";

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "${system}";
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    ## unstable
    # unstablePkgs.yt-dlp
    # unstablePkgs.get_iplayer
    # unstablePkgs.colmena
    # unstablePkgs.talhelper

    ## stable CLI
    # pkgs.age
    # pkgs.comma
    # pkgs.hcloud
    # pkgs.just
    # pkgs.lima
    # pkgs.nix
    # pkgs.nodejs
    # pkgs.opentofu
    # pkgs.pass
    # pkgs.sops
    # pkgs.turso-cli
    # pkgs.yq
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
    yq

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

  fonts = {
    packages = [
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.fira-mono
      pkgs.nerd-fonts.hack
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };

  # pins to stable as unstable updates very often
  nix = {
    registry = {
      n.to = {
        type = "path";
        path = inputs.nixpkgs;
      };
      u.to = {
        type = "path";
        path = inputs.nixpkgs-unstable;
      };
    };
  };

  # programs.nix-index.enable = true;

  programs.fish = {
    enable = true;
  };

  environment = { shells = [ pkgs.fish ]; };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "hammerspoon"
      "proton-pass"
      "ghostty"
    ];
  };
  # homebrew = {
  #   enable = true;
  #   onActivation = {
  #     cleanup = "zap";
  #     autoUpdate = true;
  #     upgrade = true;
  #   };
  #   global.autoUpdate = true;
  #   brews = [
  #     #"bitwarden-cli"
  #     "neovim"
  #     "ollama"
  #     #"tailscale"
  #     #"borders"
  #   ];
  #   taps = [
  #     #"FelixKratz/formulae" #sketchybar
  #   ];
  #   casks = [
  #     # #"screenflow"
  #     # #"cleanshot"
  #     # "adobe-creative-cloud"
  #     # #"nikitabobko/tap/aerospace"
  #     # #"alcove"
  #     # "audacity"
  #     # "autodesk-fusion"
  #     # #"balenaetcher"
  #     # "bambu-studio"
  #     # "bentobox"
  #     # "claude"
  #     # #"claude-code"
  #     # #"clop"
  #     # "chatgpt-atlas" # Atlas browser
  #     # "discord"
  #     # "displaylink"
  #     # #"docker"
  #     # "easy-move-plus-resize"
  #     # "element"
  #     # "elgato-camera-hub"
  #     # "elgato-control-center"
  #     # "elgato-stream-deck"
  #     # "firefox"
  #     # "flameshot"
  #     # "font-fira-code"
  #     # "font-fira-code-nerd-font"
  #     # "font-fira-mono-for-powerline"
  #     # "font-hack-nerd-font"
  #     # "font-jetbrains-mono-nerd-font"
  #     # "font-meslo-lg-nerd-font"
  #     # "ghostty"
  #     # "google-chrome"
  #     # "handbrake"
  #     # #"iina"
  #     # "hammerspoon"
  #     # "istat-menus"
  #     # "iterm2"
  #     # "jordanbaird-ice"
  #     # "karabiner-elements"
  #     # "lm-studio"
  #     # "logitech-options"
  #     # "macwhisper"
  #     # #"marta"
  #     # "mqtt-explorer"
  #     # "music-decoy" # github/FuzzyIdeas/MusicDecoy
  #     # "nextcloud"
  #     # "notion"
  #     # "obs"
  #     # "obsidian"
  #     # #"ollama-app"
  #     # "omnidisksweeper"
  #     # "orbstack"
  #     # "openscad"
  #     # "openttd"
  #     # "plexamp"
  #     # "portalbox"
  #     # #"popclip"
  #     # #"prusaslicer"
  #     # "raycast"
  #     # "signal"
  #     # #"shortcat"
  #     # "slack"
  #     # "spotify"
  #     # "steam"
  #     # #"wireshark"
  #     # #"viscosity"
  #     # "visual-studio-code"
  #     # "vlc"
  #     # # "lm-studio"

  #     # # # rogue amoeba
  #     # "audio-hijack"
  #     # "farrago"
  #     # "loopback"
  #     # "soundsource"
  #   ];
  masApps = { };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS configuration
  system = {
    stateVersion = 6;

    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      NSGlobalDomain.AppleShowScrollBars = "Always";
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      NSGlobalDomain.NSWindowShouldDragOnGesture = true;
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

      dock = {
        autohide = true;
      };

      trackpad = {
        Clicking = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        FXEnableExtensionChangeWarning = false;
      };

      CustomUserPreferences = {
        "com.apple.dock" = {
          launchanim = false;
          static-only = false;
          show-recents = false;
          show-process-indicators = true;
          orientation = "bottom";
          tilesize = 36;
          minimize-to-application = true;
          mineffect = "scale";
          enable-window-tool = false;
        };
        "com.apple.ActivityMonitor" = {
          OpenMainWindow = true;
          IconType = 5;
          SortColumn = "CPUUsage";
          SortDirection = 0;
        };
        "com.apple.Safari" = {
          # Privacy: don’t send search queries to Apple
          UniversalSearchEnabled = false;
          SuppressSearchSuggestions = true;
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily, not just once per week
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 1;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
        # Turn on app auto-update
        "com.apple.commerce".AutoUpdate = true;
      };
    };
  };

}
