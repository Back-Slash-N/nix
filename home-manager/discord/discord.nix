{ config, pkgs, lib, ... }:
{

  imports = [
    ./slasher.nix
  ];

  home.packages = with pkgs; [
    vesktop
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
      cp ~/.config/dotfiles/settings/vencord.json ~/.config/vesktop/settings/settings.json
      cp ~/.config/dotfiles/settings/vesktop.json ~/.config/vesktop/settings.json
      cp ~/.config/dotfiles/settings/state.json ~/.config/vesktop/state.json
      chmod +w ~/.config/vesktop/settings/settings.json
      chmod +w ~/.config/vesktop/settings.json
      chmod +w ~/.config/vesktop/state.json
      sed -i "s/_LASTFMAPIKEY_/$(cat ${config.sops.secrets.lastfm-token.path})/g" ~/.config/vesktop/settings/settings.json
    '';
  };

  services.arrpc.enable = true;
}
