{ ... }:

{
  homebrew = {
    enable = true;
    
    casks = [
      "hammerspoon"
      "iina"
      "the-unarchiver"
      "ghostty"
      "proton-pass"
    ];

    taps = [
      "siderolabs/tap"
    ];
    
    onActivation.cleanup = "zap";
  };
}
