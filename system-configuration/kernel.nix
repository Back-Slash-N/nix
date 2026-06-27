{ pkgs, config, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = [
    pkgs.linuxPackages_latest.rtl8821cu
  ];

  boot.kernelModules = [
    "msr"
  ];

  # boot.kernel.sysctl = {
  #   "vm.nr_hugepages" = 1280;
  # };

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics.enable = true;
  boot.blacklistedKernelModules = [ "rtw_8821cu" ];
  boot.kernelParams = [
    "hugepagesz=1G"
    "hugepages=3"
    "hugepagesz=2M"
    "hugepages=1280"
    "msr.allow_writes=on"
  ];
}
