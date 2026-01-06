{ pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game T>
    protontricks.enable = true;
  };
  hardware.steam-hardware.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.gamemode.enable = true;
}
