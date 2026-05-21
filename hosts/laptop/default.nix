# hosts/laptop/default.nix
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/asus.nix
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/fonts.nix
    ../../modules/kernel.nix
    ../../modules/net.nix
    ../../modules/nix.nix
    ../../modules/packages.nix
    ../../modules/timezone.nix
    ../../modules/user.nix
  ];

  networking.hostName = "laptop";

  # ── Nvidia (RTX 3070) ────────────────────────────────────────
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable      = true;
    powerManagement.enable  = true;
    open                    = false;
    nvidiaSettings          = true;
    prime = {
      # Bus IDs mit: sudo lshw -c display herausfinden
      amdgpuBusId = "PCI:1:0:0"; # anpassen!
      nvidiaBusId  = "PCI:5:0:0"; # anpassen!
      offload = {
        enable            = true;
        enableOffloadCmd  = true;
      };
    };
  };

  # ── OpenRGB Motherboard Typ ──────────────────────────────────
  services.hardware.openrgb.motherboard = "amd";

  # ── Desktop Environment (KDE wegen Nvidia) ───────────────────
  services.displayManager.sddm.enable       = true;
  services.desktopManager.plasma6.enable    = true;

  system.stateVersion = "25.11";
}
