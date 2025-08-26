# DISPLAY/WINDOW MANAGER
{ pkgs, lib, ... }:
{
  imports = [
    ./hyprlock.nix
  ];

  # WALLPAPERS
  home.file.".wallpapers" = {
    source = ../../wallpapers;
    recursive = true;
  };
  home.file.".wallpapers/wallpaper-d.sh" = {
    source = ./wallpaper-d.sh;
    executable = true;
  };

  home.packages = with pkgs; [
    hyprpolkitagent # Authentication Manager
    mpvpaper # Video Wallpaper Manager
    grim # Screenshot utils (x3)
    slurp
    swappy
    wl-clipboard
    font-awesome
    catppuccin-cursors.mochaSapphire
    jq # Used for detecting if a special workspace is active when switching to a numbered workspace
  ];

  programs.rofi = {
    enable = true;
    theme = "material";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "~/.wallpapers/wallpaper-d.sh"
        "[workspace 1 silent] code"
        "[workspace 2 silent] firefox"
        "[workspace 5 silent] kitty tmux"
        "[workspace special:magic silent] vesktop"
      ];

      "monitor" = "HDMI-A-1, 1920x1080@60, 0x0, 1";
      "$terminal" = "kitty";
      "$mod" = "alt";

      bind = [
        # Application menu
        "SUPER, SUPER_L, exec, pkill rofi || rofi -show drun"

        # Terminal Shortcut
        "$mod, q, exec, $terminal tmux"

        # Selective Screenshot
        ", Print, exec, ~/.config/hypr/scripts/screenshot rc"

        # Close Window
        "alt, w, killactive"

        # OBS Clip Hotkey
        ", F8, pass, class:^(com\.obsproject\.Studio)$"

        # Execution
        ", code:87, exec, ~/.discord-slasher.sh 0" # Orsell
        ", code:88, exec, ~/.discord-slasher.sh 1" # Bob
        ", code:89, exec, ~/.discord-slasher.sh 2" # Deepfried
        ", code:83, exec, ~/.discord-slasher.sh 0 1"
        ", code:84, exec, ~/.discord-slasher.sh 1 1"
        ", code:85, exec, ~/.discord-slasher.sh 2 1"

        # Overlayed workspace (like steam ingame overlay)
        "$mod, d, togglespecialworkspace, magic"
        "$mod SHIFT, d, movetoworkspace, special:magic"
        "$mod CONTROL, d, movetoworkspace, 1"

        # Pin window to make it always visible on all workspaces
        "$mod, p, pin"

        # Workspaces
        "control, 1, workspace, 1"
        "control, 2, workspace, 2"
        "control, 3, workspace, 3"
        "control, 3, workspace, special:magic"
        "control, 4, workspace, 4"
        "control, 5, workspace, 5"
        "control, 6, workspace, 6"
        "control, 7, workspace, 7"
        "control, 8, workspace, 8"
        "control, 9, workspace, 9"
        "alt, mouse_down, workspace, e-1"
        "alt, mouse_up, workspace, e+1"

        "control SHIFT, 1, movetoworkspace, 1"
        "control SHIFT, 2, movetoworkspace, 2"
        "control SHIFT, 3, movetoworkspace, 3"
        "control SHIFT, 3, movetoworkspace, special:magic"
        "control SHIFT, 4, movetoworkspace, 4"
        "control SHIFT, 5, movetoworkspace, 5"
        "control SHIFT, 6, movetoworkspace, 6"
        "control SHIFT, 7, movetoworkspace, 7"
        "control SHIFT, 8, movetoworkspace, 8"
        "control SHIFT, 9, movetoworkspace, 9"

        # Hide Special workspaces if active
        # Taken from https://www.reddit.com/r/hyprland/comments/1b6bf39/comment/ktfscyz/
        "control, 1, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 2, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        # "control, 3, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 4, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 5, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 6, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 7, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 8, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 9, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "alt, mouse_down, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "alt, mouse_up, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"

        # Floating windows
        "alt, f, togglefloating"
      ];

      bindm = [
        # Floating windows
        "alt, mouse:272, movewindow"
      ];

      binds = {
        "scroll_event_delay" = "0";
        "drag_threshold" = "10";
      };

      input = {
        # "name" = "sigmachip-usb-mouse";
        "sensitivity" = "0.2";
        "accel_profile" = "flat";
        "follow_mouse" = "2";
      };

      general = {
        "col.active_border" = "rgb(27F274) rgb(3BFFFF) 45deg";
        "col.inactive_border" = "rgb(ffff50) rgb(c97d2d) 45deg";

        "border_size" = "4";
        "resize_on_border" = "true";
        "extend_border_grab_area" = "10";
        "hover_icon_on_border" = "true";
      };

      decoration = {
        # "rounding" = "5";
        # "rounding_power" = "4";
        # "inactive_opacity" = "0.9";
        # shadow = {
        #   "enabled" = "true";
        #   "range" = "10";
        #   "color" = "rgb(0, 0, 0)";
        # };
      };

      animations = {
        "animation" = "specialWorkspace, 1, 3, default, slidefadevert -50%";
      };

      misc = {
        "focus_on_activate" = "true";
        "disable_hyprland_logo" = "true";
      };

      windowrule = [
        "opacity .95 override .95, class:Code"
        "workspace 1, class:Code"
        "bordercolor rgb(6600a1) rgb(ff5100) 0deg rgb(6600a1) rgb(ff5100) 0deg,floating:1"
        "workspace special:magic, class:vesktop"
        "bordersize 0, pinned:1"
        "float, initialTitle:Picture-in-Picture"
        "pin, initialTitle:Picture-in-Picture"
        "size 552 310, initialTitle:Picture-in-Picture"
        "float, initialTitle:Discord Popout"
        "pin, initialTitle:Discord Popout"
        "size 552 310, initialTitle:Discord Popout"
      ];
    };
    extraConfig = ''
      # Toggle ignoring non-special workspace binds
      bind=$mod, ESCAPE, exec, notify-send "Game mode enabled!"
      bind=$mod, ESCAPE, submap, gamemode
      submap = gamemode

      # Toggle off
      bind=$mod, ESCAPE, exec, notify-send "Game mode disabled!"
      bind=$mod, ESCAPE, submap, reset

      # Keep overlay workspace
      bind=$mod, d, togglespecialworkspace, magic

      # OBS Clip Hotkey
      bind=, F8, pass, class:^(com\.obsproject\.Studio)$

      # Full Screenshot
      bind=, Print, exec, ~/.config/hypr/scripts/screenshot sc

      # End of special bind set
      submap = reset
    '';
  };

  # Screenshots
  home.file.".config/hypr/scripts/screenshot" = {
    executable = true;
    text = ''
      #!/run/current-system/sw/bin/bash

      # Flags:

      # r: region
      # s: screen
      #
      # c: clipboard
      # f: file
      # i: interactive

      # p: pixel

      if [[ $1 == rc ]]; then
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | wl-copy
        notify-send 'Copied to Clipboard' Screenshot

      elif [[ $1 == rf ]]; then
        mkdir -p ~/Pictures/Screenshots
        filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" $filename
        notify-send 'Screenshot Taken' $filename

      elif [[ $1 == ri ]]; then
        grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | swappy -f -

      elif [[ $1 == sc ]]; then
        filename=~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png
        grim - | wl-copy
        notify-send 'Copied to Clipboard' Screenshot

      elif [[ $1 == sf ]]; then
        mkdir -p ~/Pictures/Screenshots
        filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
        grim $filename
        notify-send 'Screenshot Taken' $filename

      elif [[ $1 == si ]]; then
        grim - | swappy -f -

      elif [[ $1 == p ]]; then
        color=$(hyprpicker -a)
        wl-copy $color
        notify-send 'Copied to Clipboard' $color
      fi
    '';
  };
}
