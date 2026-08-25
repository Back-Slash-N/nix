{ pkgs, config, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [
    "msr"
  ];

  boot.kernelPatches = [ # for VR
    {
      name = "amdgpu-ignore-ctx-privileges";
      patch = pkgs.fetchpatch {
        name = "cap_sys_nice_begone.patch";
        url = "https://github.com/Back-Slash-N/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
        hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
      };
    }
  ];

  boot.kernelParams = [
    "ipv6.disable=1"
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics.enable = true;
  specialisation = {
    hugepage.configuration = {
      boot.kernelParams = [
        "hugepagesz=1G"
        "hugepages=3"
        "hugepagesz=2M"
        "hugepages=1280"
        "msr.allow_writes=on"
      ];
    };
  };
}
