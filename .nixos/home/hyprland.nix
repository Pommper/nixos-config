# home/hyprland/default.nix
{ ... }:

{
  wayland.windowManager.hyprland = {
    enable   = true;
    # withUWSM = true;
    # Liest die native Hyprland-Config aus dem hyprland/ Directory
  };

  programs.rofi.enable = true;
}
