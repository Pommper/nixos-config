{ config, pkgs, ... }:

let
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      monitor = ",preferred,auto,1.2";

      "$mod" = mainMod;

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = false;
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.95;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "0xee1a1a1a";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };

      dwindle = {
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      bezier = [
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"
        "linear, 0, 0, 1, 1"
        "almostLinear, 0.5, 0.5, 0.75, 1"
        "quick, 0.15, 0, 0.1, 1"
      ];

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint, popin 87%"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
        "zoomFactor, 1, 7, quick"
      ];

      bind = [
        "$mod, Return, exec, kitty"
        "$mod, X, killactive"
        "$mod, M, exit"
        "$mod, F, exec, nautilus"
        "$mod, V, togglefloating"
        "$mod, R, exec, caelestia launcher"
        "$mod, P, pseudo"
        "$mod, J, layoutmsg, togglesplit"

        # Caelestia global shortcuts
        "$mod, Space, global, caelestia:launcher"
        "$mod, TAB, global, caelestia:dashboard"
        "$mod, Escape, global, caelestia:session"
        "$mod, N, global, caelestia:sidebar"
        "$mod, A, global, caelestia:showall"
        #"$mod, Escape, global, caelestia:controlCenter"

        # Focus direction
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"

        # Special workspace (scratchpad)
        "$mod, mouse:274, togglespecialworkspace, magic"
        "$mod SHIFT, mouse:274, movetoworkspace, special:magic"

        # Swipe gestures (replaces deprecated workspace_swipe)
        ", SwipeLeft, workspace, e+1"
        ", SwipeRight, workspace, e-1"
      ] ++ (builtins.genList (i:
        let key = toString (if i == 9 then 0 else i + 1);
        in "$mod, ${key}, workspace, ${toString (i + 1)}"
      ) 10) ++ (builtins.genList (i:
        let key = toString (if i == 9 then 0 else i + 1);
        in "$mod SHIFT, ${key}, movetoworkspace, ${toString (i + 1)}"
      ) 10) ++ [
        ", Print, exec, grimblast copy area"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "no_initial_focus 1, match:class ^$ AND match:title ^$ AND match:xwayland 1 AND match:floating 1 AND match:fullscreen 0"
        "float on, match:class hyprland-run"
        "move 20 monitor_h-120, match:class hyprland-run"
      ];
    };
  };
}
