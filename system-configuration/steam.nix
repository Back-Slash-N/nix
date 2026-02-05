{ pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game T>
    protontricks.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  hardware.steam-hardware.enable = true;
  programs.gamemode.enable = true;
}
