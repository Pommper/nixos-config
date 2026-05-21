# NixOS Konfiguration

## Struktur

```
nixos-config/
├── flake.nix
├── hosts/
│   ├── laptop/
│   │   ├── default.nix                  # Laptop-spezifisch (Nvidia, KDE)
│   │   └── hardware-configuration.nix   # automatisch generiert
│   └── desktop/
│       ├── default.nix                  # Desktop-spezifisch (AMD, Hyprland)
│       └── hardware-configuration.nix   # automatisch generiert
├── modules/                             # systemweit, jedes Thema separat
│   ├── audio.nix
│   ├── asus.nix                         # Asus + RGB (beide Geräte)
│   ├── bluetooth.nix
│   ├── boot.nix
│   ├── fonts.nix
│   ├── kernel.nix
│   ├── net.nix
│   ├── nix.nix                          # Flakes, Garbage Collection
│   ├── packages.nix                     # systemweite Pakete
│   ├── timezone.nix
│   └── user.nix
└── home/                                # User-Konfiguration (Home Manager)
    ├── home.nix                         # Einstiegspunkt
    ├── packages.nix
    ├── git.nix
    ├── shell/
    │   └── zsh.nix                      # Zsh + Kitty + Starship
    └── hyprland/
        ├── default.nix                  # Hyprland Config
        └── binds.nix                    # Keybindings separat
```

## Erste Schritte

1. `DEINNAME` überall ersetzen
2. Git Name + Email in `home/git.nix` eintragen
3. Laptop Bus IDs in `hosts/laptop/default.nix` anpassen (`sudo lshw -c display`)
4. `hardware-configuration.nix` wird bei Installation automatisch generiert

## Befehle

```bash
# System bauen (Hostname wird automatisch erkannt)
sudo nixos-rebuild switch --flake .

# Pakete updaten
nix flake update

# Aufräumen
sudo nix-collect-garbage -d
```

## Hyprland aktivieren (Desktop)

In `home/home.nix` einkommentieren:
```nix
./hyprland/default.nix
```

## GPU Passthrough aktivieren (Desktop, später)

In `hosts/desktop/default.nix` einkommentieren:
```nix
virtualisation.libvirtd.enable = true;
boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];
```
