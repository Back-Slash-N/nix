{ pkgs, config, lib, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  home.activation = { # Discord wont let you turn off streamer mode if it detects the 'OBS' binary, luckily this is all thats needed to turn that shit off
    iHateDiscord = lib.hm.dag.entryAfter [ "writeBoundary"] ''
      rm -f /home/n/.obs-renamed
      ln -s ${config.programs.obs-studio.finalPackage}/bin/obs /home/n/.obs-renamed
    '';
  };
}
