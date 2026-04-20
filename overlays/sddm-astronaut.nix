{ inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      sddm-astronaut = prev.sddm-astronaut.overrideAttrs (_: {
        src = final.fetchFromGitHub {
          owner = "Back-Slash-N";
          repo = "sddm-astronaut-theme";
          rev = "bd93b315bec56ce4c21e180358ada8f6812c5bf5";
          hash = "sha256-H2eGkGYTRyGCd+43xsDC1TfnBfbQ8QaaMeLI+HCfmqk=";
        };
      });
    })
  ];
}
