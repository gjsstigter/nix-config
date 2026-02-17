{ config, pkgs, ... }:

{
  services.aerospace = {
    enable = true;
    settings = {
      start-at-login = true;
    };
  };
}