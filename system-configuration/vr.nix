{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # wlx-overlay-s
    # wayvr-dashboard
    alvr
  ];

  # services.wivrn = {
  #   enable = true;
  #   openFirewall = true;
  #   defaultRuntime = true;
  # # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  #   config = {
  #     enable = true;
  #     json = {
  #       # 1.0x foveation scaling
  #       scale = 1.0;
  #       # 70 Mb/s
  #       bitrate = 70000000;
  #       encoders = [
  #         {
  #           encoder = "vulkan";
  #           codec = "h264";
  #           # 1.0 x 1.0 scaling
  #           width = 1.0;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #         }
  #       ];
  #     };
  #   };
  # };

  boot.kernelPatches = [
    {
      name = "amdgpu-ignore-ctx-privileges";
      patch = pkgs.fetchpatch {
        name = "cap_sys_nice_begone.patch";
        url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
        hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
      };
    }
  ];
}
