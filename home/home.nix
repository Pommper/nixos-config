# home/home.nix
{ config, ... }:

{
  imports = [
    ./env.nix
    ./shell/zsh.nix
    # Hyprland nur auf Desktop – einkommentieren wenn bereit:
    # ./hyprland/default.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  programs.home-manager.enable = true;

  xdg.enable = true;
}
