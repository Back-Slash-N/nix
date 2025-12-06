{ pkgs, inputs, ... }:
{
  # nixpkgs.overlays = [
  #   inputs.millennium.overlays.default
  # ];
  programs.steam = {
    enable = true;
    # package = pkgs.steam-millennium; # Steam Client modding framework
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
}
# This is not the only configuration for steam! check home-manager/steam
