{ config, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.nixos";
in
{
  imports = [
    inputs.caelestia.homeModules.default
  ];


  # ── Caelestia Shell ─────────────────────────────────────────
  programs.caelestia = {
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
  };

  xdg.configFile."caelestia"={
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/caelestia";
    force = true;
    recursive = true;
  };
}
