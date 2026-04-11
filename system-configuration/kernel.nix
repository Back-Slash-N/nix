{ pkgs, config, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = [
    pkgs.linuxPackages_latest.rtl8821cu
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics.enable = true;
  boot.blacklistedKernelModules = [ "rtw_8821cu" ];
}
