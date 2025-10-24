# overlays/freetube.nix
{ config, pkgs, lib, pkgs-unstable, ... }:
{
  nixpkgs.overlays = [
    # Overlay: Use `self` and `super` to express
    # the inheritance relationship
    (self: super: {
      freetube = pkgs-unstable.freetube;
    })
  ];
}
