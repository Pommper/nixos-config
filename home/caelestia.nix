{ config, lib, pkgs, ... }:

{
  # ── Caelestia Shell ─────────────────────────────────────────
  programs.caelestia = {
    enable = true;
    cli.enable = true;
  };

  # Session-Variablen für Caelestia
  home.sessionVariables = {
    QS_DROP_EXPENSIVE_FONTS = "0";
  };
}
