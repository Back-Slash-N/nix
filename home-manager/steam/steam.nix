# STEAM USER CONFIG
# yes this is weird.. steam is literally the only user application that needs to be declared through system config.
# this is also a home configuration for things such as themes/plugins for the Millennium client mod.
{ ... }:
{
  # Space Theme
  home.file.".steam/steam/steamui/skins/Steam" = {
    source = builtins.fetchGit {
      url = "https://github.com/SpaceTheme/Steam.git";
      rev = "2250e76c6937bf06b924d014c95cedc91677cfe4";
    };
  };

  # SteamDB Plugin
  home.file.".local/share/millennium/plugins/steam-db" = {
    source = builtins.fetchGit {
      url = "https://github.com/BossSloth/Steam-SteamDB-extension.git";
      rev = "c26861d351bb19db9b3759194f4fa0c03e814658";
    };
  };

  # home.file.".config/millennium/config.json" = {
  #   source = ./config.json;
  # };

  # home.file.".config/millennium/millennium.ini" = {
  #   source = ./millennium.ini;
  # };
}
