{inputs, ...}:
let
  envFile = "${inputs.envFiles}/slskd.env";
in
{
  services.slskd = {
    enable = true;
    domain = "slskd.local";
    environmentFile = envFile;
    settings = {
      shares.directories = [];
      web.authentication.apiKeys = {
        root = {
          key = "HEFRHERFHERUHGEUGHEUH";
          role = "Administrator";
        };
      };
    };
  };
  users.users.slskd.extraGroups = [ "media" ];
  systemd.services.slskd.serviceConfig.UMask = "0002";

  networking.firewall.allowedTCPPorts = [ 5030 ]; # web ui port
}
