{ config
, pkgs
, pkgs-fork
, inputs
, lib
, sops-nix
, ... }:
let
  amplitude = pkgs.callPackage ./packages/soundboard.nix { };
in
{
  home.username = "n";
  home.homeDirectory = "/home/n";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    lutris
    gale
    r2modman
    qbittorrent
    vpkedit
    bottles # Wine
    jdk21 # J*va
    quickemu # Easy VM management
    lazygit
    sidequest
    uget
    feather
    p2pool
    xmrig
    vlc # Media Player
    modrinth-app
    pavucontrol # Volume Control
    kdePackages.kdenlive # Video Editor
    bs-manager # Beat Saber Mod Manager
    supersonic # Music player
    iwgtk # Wi-Fi manager
    btop # Process viewer/manager
    amplitude # Soundboard
    antimicrox # Game input remapper
    freetube # Youtube without the ads and tracking bs
    kdePackages.dolphin # File Manager
    kdePackages.qtsvg # Add support for SVG icons in Dolphin
    kdePackages.kio-fuse # To mount remote filesystems via FUSE
    kdePackages.kio-extras # Extra protocols support (sftp, fish and more)
    kdePackages.ark # Graphical file compression/decompression utility
    filezilla # FTP/SFTP client
    protonvpn-gui # VPN
    devbox # dev environments
    jetbrains.clion # CMake IDE
    pkgs-fork.ryubing # Switch EMU
    davinci-resolve # Video editor
  ];

  imports = [
    # ./home-manager/default-applications.nix
    ./home-manager/firefox.nix
    ./home-manager/git.nix
    ./home-manager/kitty.nix
    ./home-manager/mprisence.nix
    # ./home-manager/nemo.nix
    ./home-manager/nh.nix
    ./home-manager/notification-daemon.nix
    ./home-manager/obs.nix
    ./home-manager/tmux.nix
    ./home-manager/discord/discord.nix
    ./home-manager/fastfetch/fastfetch.nix
    ./home-manager/gimp/gimp.nix
    ./home-manager/hyprland/hyprland.nix
    # ./home-manager/quickshell/quickshell.nix
    ./home-manager/vscode/vscode.nix
    ./home-manager/waybar/waybar.nix
    ./home-manager/zsh.nix
  ];

  # Secret Management
  sops = {
    defaultSopsFile = ./system-configuration/sops/secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
    age.keyFile = "/home/n/.config/sops/age/keys.txt";
    secrets.discord-token = { path = "${config.sops.defaultSymlinkPath}/discord-token"; };
  };

  #* System Theming
  # TODO: Themes are not fully applying to all applications (i.e Dolphin)
  # yoinked from orsells config
  gtk = {
    enable = true;
    theme = {
      name = "Nightfox-Dark"; #"Breeze-Dark";
      package = pkgs.nightfox-gtk-theme; #pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "Breeze-Icons";
      package = pkgs.kdePackages.breeze-icons;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "Nightfox-Dark";
      package = pkgs.nightfox-gtk-theme;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";



  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
