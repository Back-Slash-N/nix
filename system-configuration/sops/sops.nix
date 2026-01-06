{ pkgs, inputs, config, ... }:
{
  environment.systemPackages = with pkgs; [ sops ];
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/n/.config/sops/age/keys.txt";
  sops.secrets.tailscale = { };
  sops.secrets.playit-secret = { };
}
