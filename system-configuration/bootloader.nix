{ pkgs, config, ...}:
{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback.out
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    kernelModules = [ "v4l2loopback" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        efiSupport = true;
        device = "nodev";

        theme = pkgs.stdenv.mkDerivation {
          pname = "HyperFluent";
          version = "1.0";
          src = pkgs.fetchFromGitHub {
            owner = "Back-Slash-N";
            repo = "HyperFluent-GRUB-Theme";
            rev = "50a69ef1c020d1e4e69a683f6f8cf79161fb1a92";
            hash = "sha256-l6oZqo6ATv9DWUKAe3fgx3c12SOX0qaqfwd3ppcdUZk=";
          };
          installPhase = "cp -r nixos $out";
        };
      };
    };
  };
}
