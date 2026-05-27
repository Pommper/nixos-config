# home/home.nix
{ config, ... }:

{
  imports = [
    ./env.nix
    ./shell/zsh.nix
    ./hyprland.nix
  ];

  home.username      = "micha";
  home.homeDirectory = "/home/micha";
  home.stateVersion  = "25.11";

  xdg.userDirs = {
  	enable = true;
	createDirectories = true;
  };

  programs.home-manager.enable = true;

  xdg.enable = true;
}
