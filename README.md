# NixOS Konfiguration

## Struktur

```
nixos-config/
├── flake.nix
├── flake.lock
├── hosts/
│   ├── laptop/
│   │   ├── default.nix                  # Laptop-spezifisch (Nvidia RTX 3070, KDE)
│   │   └── hardware-configuration.nix   # automatisch generiert
│   └── desktop/
│       ├── default.nix                  # Desktop-spezifisch (AMD RX 9070 XT, Hyprland)
│       └── hardware-configuration.nix   # automatisch generiert
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
├── hyprland/                            # Hyprland in nativer Syntax
│   ├── hyprland.conf                    # Hauptkonfiguration
│   └── binds.conf                       # Keybindings
└── home/                                # User-Konfiguration (Home Manager)
    ├── home.nix                         # Einstiegspunkt
    ├── env.nix                          # Umgebungsvariablen
    ├── shell/
    │   └── zsh.nix                      # Zsh + Kitty + Starship
    └── hyprland/
        └── default.nix                  # Aktiviert Hyprland via Home Manager
```

## Hardware

| Gerät | CPU | GPU | DE |
|---|---|---|---|
| Laptop | AMD Ryzen (Asus ROG Strix G17) | Nvidia RTX 3070 + AMD iGPU | KDE Plasma 6 |
| Desktop | AMD Ryzen 9 7800X | AMD RX 9070 XT | Hyprland |

## Erste Schritte nach Installation

```bash
# 1. Git temporär verfügbar machen
nix-shell -p git

# 2. Config klonen
git clone https://github.com/Pommper/nixos-config ~/.nixos

# 3. Hardware-Config kopieren
cp /etc/nixos/hardware-configuration.nix ~/.nixos/hosts/laptop/
# oder für Desktop:
cp /etc/nixos/hardware-configuration.nix ~/.nixos/hosts/desktop/

# 4. System bauen
sudo nixos-rebuild switch --flake ~/.nixos#laptop
# oder:
sudo nixos-rebuild switch --flake ~/.nixos#desktop
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

## Hyprland aktivieren (Desktop)

In `home/home.nix` einkommentieren:
```nix
./hyprland/default.nix
```

## GPU Passthrough aktivieren (Desktop, später)

In `hosts/desktop/default.nix` einkommentieren:
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
