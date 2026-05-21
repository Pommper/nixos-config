# home/home.nix
{ config, ... }:

{
  imports = [
    ./env.nix
    ./packages.nix
    ./git.nix
    ./zsh.nix
    # Hyprland nur auf Desktop – einkommentieren wenn bereit:
    # ./hyprland/default.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  programs.home-manager.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable             = true;
    createDirectories  = true;
    desktop   = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Dokumente";
    downloads = "${config.home.homeDirectory}/Downloads";
    music     = "${config.home.homeDirectory}/Musik";
    pictures  = "${config.home.homeDirectory}/Bilder";
    videos    = "${config.home.homeDirectory}/Videos";
  };
}
