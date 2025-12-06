{ pkgs, appimageTools, fetchurl }:
let
  pname = "amplitude";
  version = "2.11.0";

  src = pkgs.fetchurl {
    url = "https://github.com/dan0v/AmplitudeSoundboard/releases/download/${version}/Amplitude_Soundboard-x86_64.AppImage";
    sha256 = "sha256-va6QIDI9pXgYvjAQaBHm2kfrUeIEm1x+IudauqXgph0=";
  };
in
  appimageTools.wrapType2 { 
    inherit pname version src;
    extraPkgs = pkgs: [ pkgs.icu ];
  }
