{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Firefox.app"
      "/Applications/Slack.app"
      "/Applications/Ghostty.app"
    ];
  };
}