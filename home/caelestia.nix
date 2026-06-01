{ ... }:

{
  # ── Caelestia Shell ─────────────────────────────────────────
  programs.caelestia = {
    enable = true;
    cli.enable = true;   # caelestia-cli für volle Funktionalität

  settings = {
      general.apps = {
        terminal  = [ "kitty" ];
        audio     = [ "pavucontrol" ];
        explorer  = [ "nautilus" ];
        playback  = [ "mpv" ];
      };
    };
  };
}
