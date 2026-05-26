# modules/boot.nix
{ ... }:

{
  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
    # Letzte 5 Generationen im Bootmenü behalten
    systemd-boot.configurationLimit = 5;
  };
}
