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

    # ── Terminal Tools (Rust) ─────────────────────────────────
    eza
    bat
    ripgrep
    fd
    dust
    procs
    bottom
    zoxide
    fzf
    fastfetch
    delta
    gitui
    yazi
    atuin
    zellij
    helix

    # ── Entwicklung ───────────────────────────────────────────
    vscode
    python3
    gcc
    gnumake

    # ── Apps ──────────────────────────────────────────────────
    firefox
    brave
    vesktop
    obsidian
    nautilus    # File Manager

    # ── Editor ────────────────────────────────────────────────
    neovim

    # ── Media ─────────────────────────────────────────────────
    mpv
    yt-dlp

    # ── RGB ───────────────────────────────────────────────────
    openrgb
  ];
}
