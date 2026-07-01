# modules/bluetooth.nix
{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable      = true;
    powerOnBoot = true;
  };

  # MediaTek Bluetooth Firmware (MT7921)
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
}
