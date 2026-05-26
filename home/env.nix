# home/env.nix
{ ... }:

{
  home.sessionVariables = {
    EDITOR   = "nvim";
    BROWSER  = "brave";
    TERMINAL = "kitty";
    FILEMANAGER = "nautilus";
  };
}
