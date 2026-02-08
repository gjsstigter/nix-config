{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      # Search engines
      search = {
        default = "ddg";
        force = true;

        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS Wiki" = {
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            icon = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };

          "GitHub" = {
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
            icon = "https://github.com/favicon.ico";
            definedAliases = [ "@gh" ];
          };
        };
      };

      # Firefox settings
      settings = {
        # Privacy settings
        # "browser.contentblocking.category" = "strict";
        # "privacy.donottrackheader.enabled" = true;
        # "privacy.trackingprotection.enabled" = true;
        # "privacy.trackingprotection.socialtracking.enabled" = true;

        # # Disable telemetry
        # "datareporting.healthreport.uploadEnabled" = false;
        # "datareporting.policy.dataSubmissionEnabled" = false;
        # "toolkit.telemetry.enabled" = false;
        # "toolkit.telemetry.unified" = false;
        # "toolkit.telemetry.archive.enabled" = false;

        # # Disable pocket
        # "extensions.pocket.enabled" = false;

        # # Performance
        # "browser.cache.disk.enable" = true;
        # "browser.sessionstore.interval" = 15000;

        # # UI preferences
        # "browser.tabs.warnOnClose" = false;
        # "browser.download.useDownloadDir" = true;
        # "browser.startup.page" = 3; # Restore previous session

        # # New tab page
        # "browser.newtabpage.activity-stream.showSponsored" = false;
        # "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # # Smooth scrolling
        # "general.smoothScroll" = true;

        # # Hardware acceleration
        # "gfx.webrender.all" = true;
        # "media.ffmpeg.vaapi.enabled" = true;
      };

      # Extensions (you need to find the extension IDs)
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        # ublock-origin
        proton-pass
        # bitwarden
        # privacy-badger
        # multi-account-containers
      ];

      # User Chrome CSS (optional - for UI customization)
      # userChrome = ''
      #   /* Hide tab bar if only one tab */
      #   #tabbrowser-tabs {
      #     visibility: collapse !important;
      #   }
      #   #tabbrowser-tabs[count="1"] {
      #     visibility: visible !important;
      #   }
      # '';

      # User Content CSS (optional - for webpage customization)
      # userContent = ''
      #   /* Dark mode for all websites */
      #   * {
      #     background-color: #1e1e1e !important;
      #     color: #d4d4d4 !important;
      #   }
      # '';
    };
  };
}
