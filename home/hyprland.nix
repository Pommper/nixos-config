# home/hyprland/default.nix
{ ... }:

{
  wayland.windowManager.hyprland = {
    enable   = true;
  };

  programs.rofi.enable = true;
}
