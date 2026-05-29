{ inputs, pkgs, ... }:
{
  programs.firefox = let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in {
    enable = true;
    nativeMessagingHosts = with pkgs; [ uget-integrator ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;

      Preferences = {
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "browser.newtabpage.activity-stream.feeds.system.topstories" = lock-false;
        "browser.newtabpage.activity-stream.section.topstories.rows" = "0";
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.topstories.rows" = "0";
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
      };

      ExtensionSettings = {
        "extension@tabliss-maintained" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tablissng/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.n = {
      search = {
        force = true;
        default = "Brave";
        engines = {
          "Brave" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            definedAliases = ["@b"];
          };
        };
      };

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        # ublock-origin
        adnauseam
      ];
    };
  };
}
