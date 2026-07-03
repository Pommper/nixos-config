# home/home.nix
{ config, pkgs, ... }:

{
  imports = [
    ./home/env.nix
    ./home/shell.nix
    ./home/hyprland.nix
    ./home/caelestia.nix
    ./home/kitty.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  xdg.userDirs = {
  	enable = true;
	createDirectories = true;
	setSessionVariables = true;

  	documents = "${config.home.homeDirectory}/Documents";
  	download  = "${config.home.homeDirectory}/Downloads";
  	music     = "${config.home.homeDirectory}/Music";
  	pictures  = "${config.home.homeDirectory}/Pictures";
  	videos    = "${config.home.homeDirectory}/Videos";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };   

  # GTK-Theming
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}
