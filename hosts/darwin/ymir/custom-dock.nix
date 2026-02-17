{ config, ... }:
{
  system.defaults.dock = {
    autohide = true;
    magnification = true;
    expose-group-apps = true;
    show-recents = true;
    orientation = "left";
  tilesize = 36;
  minimize-to-application = false;
  showLaunchpadGestureEnabled = true;
    persistent-apps = [
      "/System/Applications/Messages.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Calendar.app"
      "/Applications/Nix Apps/Firefox.app"
      "/Applications/Nix Apps/Slack.app"
      "/Applications/Ghostty.app"
      "/Applications/Nix Apps/OrbStack.app"
      "/Applications/Proton Pass.app"
      "/Applications/Nix Apps/Spotify.app"
      "/Users/sstigter/Applications/PhpStorm.app"
    ];
  };
}
