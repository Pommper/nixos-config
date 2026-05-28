# home/home.nix
{ config, pkgs, caelestia-shell, ... }:

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
	desktop   = "${config.home.homeDirectory}/Desktop";
  	documents = "${config.home.homeDirectory}/Documents";
  	download  = "${config.home.homeDirectory}/Downloads";
  	music     = "${config.home.homeDirectory}/Music";
  	pictures  = "${config.home.homeDirectory}/Pictures";
  	videos    = "${config.home.homeDirectory}/Videos";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;

  # ── Caelestia Shell ─────────────────────────────────────────
  home.packages = [
  	caelestia-shell.packages.x86_64-linux.with-cli
  ];
}
