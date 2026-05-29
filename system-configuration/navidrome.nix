{ lib, inputs, ... }:
let
  envFile = "${inputs.envFiles}/navidrome.env";
in
{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    environmentFile = envFile;
    settings = {
      MusicFolder = "/home/lidarr";
      Address = "0.0.0.0";
    };
  };

  systemd.services.navidrome.serviceConfig = {
    ReadOnlyPaths = [ "/home/lidarr" ];
    ProtectHome = lib.mkForce "read-only";
  };
}
