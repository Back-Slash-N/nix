{lib, config, pkgs, ...}:
let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
    themeConfig = {
      HourFormat = "hh:mm ap";
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    labwc
  ];

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <dir>/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Fonts</dir>
    </fontconfig>
  '';

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";

    # Enables experimental Wayland support
    wayland = {
      enable = true;
      # compositor = "kwin";
    };
    settings = {
      Wayland = {
        CompositorCommand = "${pkgs.labwc}/bin/labwc -s sddm-greeter-qt";
      };
    };

    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
    ];
  };
}
