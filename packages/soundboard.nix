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



# { pkgs, lib, ... }:
# let
#   pname = "amplitude";
#   version = "2.11.0";
#   name = "${pname}-${version}";

#   src = pkgs.fetchurl {
#     url = "https://github.com/dan0v/AmplitudeSoundboard/releases/download/${version}/Amplitude_Soundboard-x86_64.AppImage";
#     sha256 = "";
#   };

#   appimageContents = pkgs.appimageTools.extractType2 { inherit name src; };
# in
# pkgs.appimageTools.wrapType2 rec {
#   inherit name src;

#   extraInstallCommands = ''
#     mv $out/bin/${name} $out/bin/${pname}
#     install -m 444 -D ${appimageContents}/amplitude.desktop $out/share/applications/${pname}.desktop

#     install -m 444 -D ${appimageContents}/${pname}.png $out/share/icons/hicolor/512x512/apps/${pname}.png

#     substituteInPlace $out/share/applications/${pname}.desktop \
#     	--replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname} %U'
#   '';

#   meta = with lib; {
#     description = "A sleek cross-platform soundboard, available for Windows, MacOS, and Linux";
#     homepage = "https://github.com/dan0v/AmplitudeSoundboard";
#     license = licenses.gpl3;
#     maintainers = [ ];
#     platforms = [ "x86_64-linux" ];
#   };
# }



# { pkgs }:
# let
#   name = "amplitude";
#   version = "2.11.0";
#   sha256 = "07d6w2jvlnp749z5r6q4w98yniyswq8nh41hpqc7i99x68h91bmx";
# in with pkgs; appimageTools.wrapType2 { # or wrapType1
#   inherit name;
#   src = fetchurl {
#     url = "https://github.com/dan0v/AmplitudeSoundboard/releases/download/${version}/Amplitude_Soundboard-x86_64.AppImage";
#     inherit sha256;
#   };

#   extraPkgs = pkgs: with pkgs; [ curl ];
# }
