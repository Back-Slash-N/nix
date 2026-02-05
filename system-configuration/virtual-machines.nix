{ inputs, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    spice-gtk
    virt-manager
  ];

  # Enable Virt-manager
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      vhostUserPackages = with pkgs; [ virtiofsd ];
      runAsRoot = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";
  programs.virt-manager.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "n" ];

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  boot.kernelParams = [ 
    "amd_iommu=on" 
    "iommu=pt" 
    "kvm_amd.nested=1" # Good for macOS performance on AMD
  ];

  services.udev.extraRules = ''
    # Grant read/write access to all Apple devices to the libvirtd group
    SUBSYSTEM=="usb", ATTR{idVendor}=="05ac", MODE="0666", GROUP="libvirtd"
  '';

  virtualisation.libvirtd.qemu.verbatimConfig = ''
    user = "root"
    group = "root"
  '';

  virtualisation.vmVariant = {
  # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize =  8192;
      cores = 8;
      diskSize = 20000;
    };
  };
}
