# home/home.nix
{ config, pkgs, ... }:

{
  imports = [
    ./env.nix
    ./shell/zsh.nix
    ./hyprland.nix
    ./caelestia.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  xdg.userDirs = {
  	enable = true;
	createDirectories = true;
	desktop   = "${config.home.homeDirectory}/Desktop";
  	documents = "${config.home.homeDirectory}/Documents";
  	download  = "${config.home.homeDirectory}/Downloads";
  	music     = "${config.home.homeDirectory}/Music";
  	pictures  = "${config.home.homeDirectory}/Pictures";
  	videos    = "${config.home.homeDirectory}/Videos";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}
