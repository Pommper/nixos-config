# home/zsh.nix
{ ... }:

{
  programs.kitty = {
    enable = true;
    font   = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };
    settings = {
      background_opacity      = "0.95";
      confirm_os_window_close = 0;
      enable_audio_bell       = false;
    };
  };

  programs.zsh = {
    enable                    = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;
    enableCompletion          = true;

    shellAliases = {
      ls      = "eza --icons";
      ll      = "eza -la --icons";
      lt      = "eza --tree --icons";
      cat     = "bat";
      cd      = "z";
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos";
      update  = "nix flake update ~/.nixos";
      cleanup = "sudo nix-collect-garbage -d";
      gs      = "git status";
      gp      = "git push";
      gl      = "git pull";
      ga      = "git add .";
      gc      = "git commit -m";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
      eval "$(atuin init zsh)"
    '';
  };

  programs.starship = {
    enable   = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol   = "[❯](bold red)";
      };
      nix_shell.symbol = "❄️ ";
    };
  };
}
