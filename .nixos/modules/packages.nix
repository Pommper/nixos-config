# modules/packages.nix
# Alle Pakete systemweit verfügbar
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── System Tools ──────────────────────────────────────────
    git
    wget
    curl
    unzip
    pciutils    # lspci
    usbutils    # lsusb
    lshw        # Hardware Info
    nix-tree    # Nix Abhängigkeiten visualisieren
    nvd         # Nix Version Diff

    # ── Terminal Tools ─────────────────────────────────
    eza
    bat
    ripgrep
    fd
    dust
    procs
    zoxide
    fzf
    fastfetch
    delta
    gitui
    yazi
    atuin
    zellij
    btop

    # ── Entwicklung ───────────────────────────────────────────
    vscode
    python3
    gcc
    gnumake

    # ── Apps ──────────────────────────────────────────────────
    brave
    vesktop
    nautilus    # File Manager
    kitty
    spotify
    steam
<<<<<<< HEAD
    rofi
=======
>>>>>>> 4bf4a484c1fe0d247f1c3d2208717361b167dc43

    # ── Editor ────────────────────────────────────────────────
    neovim

    # ── Media ─────────────────────────────────────────────────
    mpv
    yt-dlp

    # ── RGB ───────────────────────────────────────────────────
    openrgb
  ];
}
