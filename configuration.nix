# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./system-configuration/bootloader.nix
      ./system-configuration/steam.nix
      ./system-configuration/tailscale.nix
      # ./system-configuration/kde.nix
      # ./system-configuration/sddm.nix
      ./system-configuration/virtual-machines.nix
      ./system-configuration/greeter/greeter.nix
      ./system-configuration/sops/sops.nix
    ];

  networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  networking.enableIPv6  = false;
  networking.nameservers = [ "192.168.1.56" ];

  programs.hyprland.enable = true;

  security.polkit.enable = true;
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings = {
    auto-optimise-store = true;

    # Flakes
    experimental-features = [ "nix-command" "flakes" ];
  };
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Define a user account.
  users.users.n = {
    isNormalUser = true;
    initialPassword = "n"; # CHANGE THIS AFTER INSTALL!!
    description = "n";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "libvirtd" ];
  };

  # Enable key-signing
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
    Host github.com
      IdentityFile ~/.ssh/github
    '';
  };
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = "pinentry-gtk2";
    enableSSHSupport = false;
  };

  # VR
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

  programs.adb.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    skia
  ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wget
    protonup-qt
    tailscale
    gnupg
    wlx-overlay-s
  ];
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
# ...

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

