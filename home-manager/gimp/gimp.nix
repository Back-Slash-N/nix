{ config, pkgs, ... }:
let
  photogimp = pkgs.callPackage ./PhotoGIMP.nix { };
in {

  home.packages = with pkgs; [gimp];
  
  home.file.".config/GIMP/3.0" = {
    source = photogimp;
    recursive = true; # This is optional
  };
}
