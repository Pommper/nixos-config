# modules/nix.nix
# Nix-spezifische Einstellungen
{ ... }:

{
  nix = {
    settings = {
      # Flakes und neue CLI aktivieren
      experimental-features = [ "nix-command" "flakes" ];
      # Automatisch optimieren (gleiche Dateien nur einmal speichern)
      auto-optimise-store   = true;
    };

    # Alte Generationen automatisch aufräumen
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };
  };
}
