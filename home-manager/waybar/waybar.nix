{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar" = {
    source = ./bar;
    recursive = true;
  };
}