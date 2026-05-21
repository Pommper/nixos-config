# modules/kernel.nix
{ pkgs, ... }:

{
  # Neuester stabiler Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel Parameter für bessere Performance
  boot.kernelParams = [
    "quiet"          # weniger Boot-Output
    "splash"
    "nowatchdog"     # Watchdog deaktivieren (etwas schnellerer Boot)
  ];
}
