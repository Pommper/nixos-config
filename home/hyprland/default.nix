# home/hyprland/default.nix
{ ... }:

{
  wayland.windowManager.hyprland = {
    enable   = true;
    withUWSM = true;
    # Liest die native Hyprland-Config aus dem hyprland/ Directory
    extraConfig = builtins.readFile ../../hyprland/hyprland.conf;
  };

  programs.rofi.enable = true;

  # Ganzes hyprland/ Directory nach ~/.config/hypr/ verlinken
  xdg.configFile."hypr" = {
    source    = ../../hyprland;
    recursive = true;
  };
}
