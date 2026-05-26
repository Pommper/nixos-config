# home/home.nix
{ config, ... }:

{
  imports = [
    ./env.nix
<<<<<<< HEAD
    ./shell/zsh.nix
=======
    ./zsh.nix
>>>>>>> 4bf4a484c1fe0d247f1c3d2208717361b167dc43
    # Hyprland nur auf Desktop – einkommentieren wenn bereit:
    ./hyprland/default.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  programs.home-manager.enable = true;

  xdg.enable = true;
}
