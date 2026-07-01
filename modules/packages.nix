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
    psmisc
    pciutils    # lspci
    usbutils    # lsusb
    lshw        # Hardware Info
    nix-tree    # Nix Abhängigkeiten visualisieren
    nvd         # Nix Version Diff

    # ── Hyprland ───────────────────────────────────────
    hypridle
    hyprpaper

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
    opencode

    # ── Entwicklung ───────────────────────────────────────────
    vscode
    python3
    gcc
    gnumake

    # ── Apps ──────────────────────────────────────────────────
    brave
    (discord.override { withVencord = true; })
    nautilus
    kitty
    spotify
    rofi
    quickshell
    win2xcur
    modrinth-app
    prismlauncher

    # ── Editor ────────────────────────────────────────────────
    neovim

    # ── Media ─────────────────────────────────────────────────
    mpv
    yt-dlp

    # ── RGB ───────────────────────────────────────────────────
    openrgb
  ];
}
