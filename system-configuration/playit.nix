{ config, ... }: {
  services.playit = {
    enable = true;
    secretPath = config.sops.secrets."playit-secret".path;
  };
}
