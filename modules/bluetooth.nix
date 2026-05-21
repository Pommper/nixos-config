# modules/bluetooth.nix
{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable      = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
