{ config, pkgs, lib, ... }:
{

  imports = [
    ./slasher.nix
  ];

  home.packages = with pkgs; [
    vesktop
    jq
  ];

  # vencord theme
  home.file = {
    ".config/vesktop/themes" = {
      source = ./theme;
      recursive = true;
    };

    ".config/dotfiles/settings/vesktop.json" = {
      source = ./settings/settings-vesktop.json;
    };

    ".config/dotfiles/settings/vencord.json" = {
      source = ./settings/settings-vencord.json;
    };

    ".config/dotfiles/settings/state.json" = {
      source = ./settings/state.json;
    };
  };

  home.activation = {
    restoreSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ~/.config/vesktop/settings/
      if [ ! -f ~/.config/vesktop/settings/settings.json ] || grep -q "_LASTFMAPIKEY_" ~/.config/vesktop/settings/settings.json; then
        cp ~/.config/dotfiles/settings/vencord.json ~/.config/vesktop/settings/settings.json
        cp ~/.config/dotfiles/settings/vesktop.json ~/.config/vesktop/settings.json
        cp ~/.config/dotfiles/settings/state.json ~/.config/vesktop/state.json
        chmod +w ~/.config/vesktop/settings/settings.json
        chmod +w ~/.config/vesktop/settings.json
        chmod +w ~/.config/vesktop/state.json
        sed -i "s/_LASTFMAPIKEY_/$(cat ${config.sops.secrets.lastfm-token.path})/g" ~/.config/vesktop/settings/settings.json
      else
        export TOKEN=$(cat ~/.config/vesktop/settings/settings.json | jq -r '.plugins.LastFMRichPresence.apiKey')
        cp ~/.config/dotfiles/settings/vencord.json ~/.config/vesktop/settings/settings.json
        cp ~/.config/dotfiles/settings/vesktop.json ~/.config/vesktop/settings.json
        cp ~/.config/dotfiles/settings/state.json ~/.config/vesktop/state.json
        chmod +w ~/.config/vesktop/settings/settings.json
        chmod +w ~/.config/vesktop/settings.json
        chmod +w ~/.config/vesktop/state.json
        sed -i "s/_LASTFMAPIKEY_/$TOKEN/g" ~/.config/vesktop/settings/settings.json
      fi
    '';
  };

  services.arrpc.enable = true;
}
