# modules/bluetooth.nix
{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable      = true;
    powerOnBoot = true;
  };

  #services.blueman.enable = true;

  # MediaTek Bluetooth Firmware (MT7921)
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
}
