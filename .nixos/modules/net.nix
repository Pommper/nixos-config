# modules/net.nix
{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable          = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };
}
