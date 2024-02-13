
{ pkgs, lib, config, ... }:


{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ ];
    settings = { };
    extraConfig = ''
# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=eDP-1,1920x1080,auto,1
# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = waybar & hyprpaper & swaync & nm-applet
exec-once = wl-paste -t text --watch clipman store --no-persist
exec-once = swayidle -w timeout 600 'swaylock -f' timeout 660 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'



# Some default env vars.
env = XCURSOR_SIZE,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
  kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 2

    touchpad {
      natural_scroll = yes
        disable_while_typing = yes
    }

  sensitivity = 0.1 # -1.0 - 1.0, 0 means no modification.
}

# █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
# █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄

general {
  gaps_in = 10
    border_size = 3
    col.active_border = rgb(89B482) rgb(A9B665) 45deg
    col.inactive_border = rgb(282828)
    no_border_on_floating = false # enable border on float window
    layout = dwindle
    no_cursor_warps = true
}



# █▀▄▀█ █ █▀ █▀▀
# █░▀░█ █ ▄█ █▄▄

misc {
  disable_hyprland_logo = true
    disable_splash_rendering = true
    mouse_move_enables_dpms = true
    vfr = true
    vrr = 1
    animate_manual_resizes = true
    mouse_move_focuses_monitor = false
    enable_swallow = true
    swallow_regex = ^(wezterm)$
}



# █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
# █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█

decoration {

# █▀█ █▀█ █░█ █▄░█ █▀▄   █▀▀ █▀█ █▀█ █▄░█ █▀▀ █▀█
# █▀▄ █▄█ █▄█ █░▀█ █▄▀   █▄▄ █▄█ █▀▄ █░▀█ ██▄ █▀▄
  rounding = 10

# █▀█ █▀█ ▄▀█ █▀▀ █ ▀█▀ █▄█
# █▄█ █▀▀ █▀█ █▄▄ █ ░█░ ░█░
# active_opacity = 1.0
# inactive_opacity = 2.0


# █▄▄ █░░ █░█ █▀█
# █▄█ █▄▄ █▄█ █▀▄
    blur {
      enabled = true
        size = 2
        passes = 2
        new_optimizations = true
        xray = true
        ignore_opacity = false
    }
# █▀ █░█ ▄▀█ █▀▄ █▀█ █░█░█
# ▄█ █▀█ █▀█ █▄▀ █▄█ ▀▄▀▄▀
  #shadow_ignore_window = true
  #shadow_offset = 1 2
  #shadow_range = 10
  #shadow_render_power = 5
  #col.shadow = 0x66404040
  drop_shadow = true
    shadow_range = 20
    shadow_render_power = 3
    col.shadow = rgb(000000)
    blurls = gtk-layer-shell
    blurls = waybar
    blurls = lockscreen
  }



animations {
  enabled = yes

    bezier    = overshot, 0.13, 1.09, 0.69, 1.0
    animation = windows, 1, 7, overshot, slide
    animation = windowsIn, 1, 7, overshot, slide
    animation = windowsOut, 1, 7, overshot, slide
    animation = windowsMove, 1, 7, overshot, slide
    animation = border, 1, 10, default
    animation = fade, 1, 7, overshot,
              animation = workspaces, 1, 7, overshot, slide
}
dwindle {
  no_gaps_when_only = false
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
}

master {
# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
  new_is_master = true
}

gestures {
# See https://wiki.hyprland.org/Configuring/Variables/ for more
  workspace_swipe = on
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:corsair-corsair-katar-pro-gaming-mouse {
         sensitivity = -0.7
       }
device:corsair-corsair-katar-pro-gaming-mouse-1 {
         sensitivity = -0.7
       }


# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = ALT

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Return, exec, kitty
# bind = $mainMod, K, exec, /home/debxd/.config/hypr/wall.sh

bind = $mainMod SHIFT, Q, killactive
bind = $mainMod, D, exec, rofi -show drun
bind = $mainMod, P, pseudo,, # dwindle
bind = $mainMod SHIFT, J, togglesplit # dwindle
bind= $mainMod, F, fullscreen
bind = $mainMod, space, togglefloating
bind = $mainMod SHIFT, l, exec, swaylock
bind = $mainMod, V, exec, clipman pick -t rofi

# # Move focus with mainMod + arrow keys
bind = $mainMod, h, movefocus, l
bind = $mainMod, l, movefocus, r
bind = $mainMod, k, movefocus, u
bind = $mainMod, j, movefocus, d
#

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Volume
binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
binde=, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-
binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Audio
bind = , XF86AudioPrev, exec, playerctl prev
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPlay, exec, playerctl play-pause

# Brighness
bind =, XF86MonBrightnessDown, exec, brightnessctl s 5%-
bind =, XF86MonBrightnessUp, exec, brightnessctl s 5%+ # Fullscreen bind = $mainMod, F, fullscreen swaylock bind = $mainMod SHIFT, L, exec, swaylock




# screenshot
# screenshot of a region
bind = SHIFT, Print, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 1000
# screenshot of the whole screen
bind =, Print, exec, grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen taken" -t 1000

# Screen Recording
#bind = $mainMod, R, exec,  wf-recorder --audio=alsa_output.pci-0000_05_00.6.analog-stereo.monitor --file="~/ScreenRecord-$(date).mp4"
#bind = $mainMod, C, exec, pkill wf-recorder
misc {
    disable_hyprland_logo = true
    disable_splash_rendering = false
}
# for screen sharing
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$

#windowrule = opacity 1.0 override 0.9 override,^(kitty)$ # set opacity to 1.0 active and 0.5 inactive for kitty

# NVIDIA Stuff
 env = WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1

 env = LIBVA_DRIVER_NAME,nvidia
 env = XDG_SESSION_TYPE,wayland
 env = __GLX_VENDOR_LIBRARY_NAME,nvidia
 env = WLR_NO_HARDWARE_CURSORS,1
 '';
  };
}
