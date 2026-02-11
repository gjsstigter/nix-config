{ config, ... }:
{
  system.defaults.dock = {
    expose-group-apps = true;
    show-recents = true;
    persistent-apps = [
      "/System/Applications/Messages.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Calendar.app"
      "/Applications/Nix Apps/Firefox.app"
      "/Applications/Nix Apps/Slack.app"
      "/Applications/Ghostty.app"
      "/Applications/Nix Apps/OrbStack.app"
      "/Applications/Proton Pass.app"
    ];
  };
}
