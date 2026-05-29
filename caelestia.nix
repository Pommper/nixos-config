{ pkgs, inputs, ... }:
{
  home-manager.users.micha = {
    # import the home manager module
    imports = [
      inputs.caelestia.homeModules.default
    ];

    programs.caelestia = {
      enable = true;
      cli.enable = true; # Also adds caelestia-cli to path
    };
  };
}
