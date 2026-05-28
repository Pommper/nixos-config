# home/home.nix
{ config, ... }:

{
  imports = [
    ./env.nix
    ./zsh.nix
    ./hyprland.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  xdg.userDirs = {
    enable            = true;
    createDirectories = true;
    desktop   = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Dokumente";
    download  = "${config.home.homeDirectory}/Downloads";  # kein s!
    music     = "${config.home.homeDirectory}/Musik";
    pictures  = "${config.home.homeDirectory}/Bilder";
    videos    = "${config.home.homeDirectory}/Videos";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}
