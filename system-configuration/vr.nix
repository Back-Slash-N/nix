{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # wlx-overlay-s
    # wayvr-dashboard
    alvr
  ];

  services.wivrn = {
    enable = true;
    openFirewall = true;
    # defaultRuntime = true;
  # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
    config = {
      enable = true;
      json = {
        # 1.0x foveation scaling
        scale = 1.0;
        # 70 Mb/s
        bitrate = 70000000;
        encoders = [
          {
            encoder = "vulkan";
            codec = "h264";
            # 1.0 x 1.0 scaling
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
      };
    };
  };
}
