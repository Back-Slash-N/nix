{ pkgs, ... }:
{
  services.lidarr = {
    enable = true;
    openFirewall = true;
  };
  users.groups.media = {};
  users.users.lidarr.extraGroups = [ "media" ];
}
