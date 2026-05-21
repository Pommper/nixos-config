# home/hyprland/default.nix
{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # Liest die native Hyprland-Config ein
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  programs.wofi.enable = true;
}
