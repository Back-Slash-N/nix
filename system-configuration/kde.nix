{ config, pkgs, ... }:
let
  wallpaperImg = ../wallpapers/connor.png;
in {
  # KDE Plasma configuration
  services.desktopManager.plasma6.enable = true;
  systemd.user.services.set-wallpaper = {
      enable = true;
      description = "Set KDE Plasma wallpaper";
      serviceConfig.ExecStart = [ "/run/current-system/sw/bin/plasma-apply-wallpaperimage ${wallpaperImg}" ];
      wantedBy = [ "plasma-workspace.target" ];
      after = [ "plasma-workspace.target" ];
    };
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
  ];
}
