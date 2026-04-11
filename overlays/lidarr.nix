{ inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      lidarr = prev.lidarr.overrideAttrs (old: {
        src = inputs.lidarr-bin;
        version = "plugin-" + (builtins.substring 11 18 inputs.lidarr-bin.outPath);
      });
    })
  ];
}
