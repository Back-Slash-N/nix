{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "PhotoGIMP";
  version = "3.0";
  src = fetchFromGitHub {
    owner = "Diolinux";
    repo = "PhotoGIMP";
    rev = "af558b2889cd504fb4ed3db06c014cf36a4c8720";
    hash = "sha256-OLEqtI2Hem2fTTL0KNf0aZsFfuwwhgE4etyRMcW5KiQ=";
  };
  patchPhase = ''
    echo 'hello' > jamestest
  '';

  installPhase = ''
    cp -r .config/GIMP/3.0 $out
  '';
}