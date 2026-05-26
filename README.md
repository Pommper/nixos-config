# NixOS Konfiguration

## Struktur

```
nixos-config/
├── flake.nix
├── flake.lock
├── host
│   ├── default.nix                  # Desktop-spezifisch (AMD RX 9070 XT, Hyprland)
│   └── hardware-configuration.nix   # automatisch generiert
├── modules/                             # systemweit, jedes Thema separat
│   ├── asus.nix                         # Asus + RGB (beide Geräte)
│   ├── audio.nix                        # Pipewire
│   ├── bluetooth.nix                    # Bluetooth + MediaTek Firmware
│   ├── boot.nix                         # Bootloader
│   ├── fonts.nix                        # Schriftarten
│   ├── kernel.nix                       # Kernel
│   ├── net.nix                          # Netzwerk + Firewall
│   ├── nix.nix                          # Flakes, Garbage Collection, allowUnfree
│   ├── packages.nix                     # Alle Pakete systemweit
│   ├── timezone.nix                     # Zeitzone, Sprache, Tastatur
│   └── user.nix                         # User micha
└── home/                                # User-Konfiguration (Home Manager)
    ├── home.nix                         # Einstiegspunkt
    ├── env.nix                          # Umgebungsvariablen
    ├── hyprland.nix                     # Aktiviert hyprland
    └── shell/
        └── zsh.nix                      # Zsh + Kitty + Starship
```

## Hardware

| Gerät | CPU | GPU | DE |
|---|---|---|---|
| Desktop | AMD Ryzen 9 7800X | AMD RX 9070 XT | Hyprland |

## Erste Schritte nach Installation

```bash
# 1. Git temporär verfügbar machen
nix-shell -p git

# 2. Config klonen
git clone https://github.com/Pommper/nixos-config ~/.nixos

# 3. Hardware-Config kopieren
cp /etc/nixos/hardware-configuration.nix ~/.nixos/host/

# 4. System bauen
sudo nixos-rebuild switch --flake ~/.nixos#nix-btw
```

## Wichtige Befehle

```bash
# System bauen
rebuild         # Alias für: sudo nixos-rebuild switch --flake ~/.nixos

# Pakete updaten
update          # Alias für: nix flake update ~/.nixos

# Aufräumen
cleanup         # Alias für: sudo nix-collect-garbage -d

# Git shortcuts
gs              # git status
ga              # git add .
gc "nachricht"  # git commit -m
gp              # git push
gl              # git pull
```

## GPU Passthrough aktivieren (Desktop, später)

In `host/default.nix` einkommentieren:
```nix
virtualisation.libvirtd.enable = true;
virtualisation.libvirtd.qemu.ovmf.enable = true;
boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];
```

## Bekannte Probleme

- **asusd** startet nicht automatisch → `sudo mkdir -p /etc/asusd && sudo systemctl start asusd`
- **rog-control-center** stürzt ab → nur kosmetisch, asusctl funktioniert im Terminal
- **Bluetooth** braucht MediaTek Firmware → bereits in `modules/bluetooth.nix` konfiguriert
