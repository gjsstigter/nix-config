{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Mail.app"
      "/Applications/Nix Apps/Firefox.app"
      "/Applications/Nix Apps/Slack.app"
      "/Applications/Ghostty.app"
    ];
  };
}
