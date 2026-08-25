{ inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      lidarr = prev.lidarr.overrideAttrs (oldAttrs: {
        src = final.fetchFromGitHub {
          owner = "Lidarr";
          repo = "Lidarr";
          rev = "e42a7ca4fd633e021d69da7daa0368b870b0282e";
          hash = "sha256-vjLoMU7Ow9rFFcZjCUvqoKZnrmg3TeB8Cqh1nSF8shM=";
        };
        doCheck = false;
      });
    })
  ];
}
