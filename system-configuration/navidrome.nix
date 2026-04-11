{...}:
{
  services.navidrome = {
    enable = true;
    openFirewall = true;
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
