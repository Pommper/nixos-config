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
  /*programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = true;
      };
      paths.wallpaperDir = "~/Images";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };*/
}
