# modules/user.nix
{ pkgs, ... }:

{
  users.users.micha = {
    isNormalUser = true;
    shell        = pkgs.zsh;
    extraGroups  = [
      "wheel"          # sudo
      "networkmanager"
      "plugdev"        # OpenRGB / liquidctl
      "libvirtd"       # VM (Desktop)
      "video"
      "audio"
    ];
  };

  # Zsh systemweit aktivieren
  programs.zsh.enable = true;
}
