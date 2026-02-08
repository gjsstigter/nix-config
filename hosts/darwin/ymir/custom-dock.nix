{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Nix Apps/Firefox.app"
      "/Applications/Nix Apps/Slack.app"
      "/Applications/Ghostty.app"
    ];
  };
}
