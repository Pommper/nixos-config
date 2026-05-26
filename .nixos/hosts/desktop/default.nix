# hosts/desktop/default.nix
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/asus.nix
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/kernel.nix
    ../../modules/net.nix
    ../../modules/nix.nix
    ../../modules/packages.nix
    ../../modules/timezone.nix
    ../../modules/user.nix
  ];

  networking.hostName = "nix-btw";

  # ── AMD GPU (RX 9070 XT) ─────────────────────────────────────
  hardware.amdgpu.enable            = true;
  services.xserver.videoDrivers     = [ "amdgpu" ];
  services.hardware.openrgb.motherboard = "amd";

  # ── Hyprland ─────────────────────────────────────────────────
  programs.hyprland = {
    enable          = true;
    withUWSM        = true;
  };
  services.displayManager.sddm = {
    enable          = true;
    wayland.enable  = true;
  };

  # ── Bootloader (Grub statt systemd-boot) ─────────────────────
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable  = true;
    device  = "nodev";
    efiSupport = true;
  };
boot.loader.efi.canTouchEfiVariables = true;

  # ── GPU Passthrough (später einrichten) ──────────────────────
  # virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemu.ovmf.enable = true;
  # boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
  # boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];

  system.stateVersion = "25.11";
}
