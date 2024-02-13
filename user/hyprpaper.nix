{ pkgs, lib, config, ... }:

{
 xdg.configFile."hypr/paper".source = ./hyprpaper;
          xdg.configFile."hypr/hyprpaper.conf".text = ''
            preload = ~/.config/hypr/paper/animeBike.png
            ipc = off
          '';
          xdg.configFile = {
            "hypr/paper/wallpaper2.jpg".source = ./hyprpaper/animeBike.png;
          };
}
