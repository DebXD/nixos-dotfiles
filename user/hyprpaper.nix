{ pkgs, lib, config, ... }:

{
 xdg.configFile."hypr/hyprpaper".source = ./hyprpaper;
          xdg.configFile."hypr/hyprpaper.conf".text = ''
            preload = /home/debxd/.config/hypr/hyprpaper/animeBike.png
            wallpaper = eDP-1, /home/debxd/.config/hypr/hyprpaper/animeBike.png
          '';
}
