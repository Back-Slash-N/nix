{ pkgs, pkgs-fork, lib, ... }:
{
  services.foldingathome = {
    enable = true;
    package = pkgs-fork.fahclient;
    user = "2m4vdefi2po5";
    team = 234980;
    extraArgs = [
      "--account-token" "ecbr-ecbsLKqhsLKYokTgYosstcIMsstBIAEtBK6_fs"
    ];
  };

  environment.systemPackages = with pkgs; [fahclient];

  systemd.tmpfiles.rules = ["L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"];
  environment.variables.OCL_ICD_VENDORS = "${pkgs.rocmPackages.clr.icd}/etc/OpenCL/vendors/";

  systemd.services.foldingathome = {
    serviceConfig = {
      DynamicUser = lib.mkForce false;
      # User = "n";
      DeviceAllow = [ "/dev/dri" "char-drm" "/dev/dri/card1" "/dev/dri/card0" ];
      Environment = [
        "OCL_ICD_VENDORS = ${pkgs.rocmPackages.clr.icd}/etc/OpenCL/vendors/"
      ];
    };
  };
}
