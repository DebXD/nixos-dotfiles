{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "debxd";
  home.homeDirectory = "/home/debxd";
  home.enableNixpkgsReleaseCheck = false;


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  gtk.enable = true;
  # home.file = {
  #   ".icons/cursors".source = "${pkgs.capitaine-cursors-themed}/share/icons/capitaine-cursors-themed";
  # };
  #gtk.cursorTheme.package = pkgs.capitaine-cursors-themed;
  #gtk.cursorTheme.name =  "Capitaine Cursors (Gruvbox)";
  #x11.pointerCursor.package = pkgs
  home.pointerCursor = {
    name = "Capitaine Cursors (Gruvbox)";
    package = pkgs.capitaine-cursors-themed;
    gtk.enable = true;
    x11.enable = true;
};
  # home.pointerCursor =
  #   let
  #     getFrom = url: hash: name: {
  #         gtk.enable = true;
  #         x11.enable = true;
  #         name = name;
  #         size = 48;
  #         package =
  #           pkgs.runCommand "moveUp" {} ''
  #             mkdir -p $out/share/icons
  #             ln -s ${pkgs.fetchzip {
  #               url = url;
  #               hash = hash;
  #             }} $out/share/icons/${name}
  #         '';
  #       };
  #   in
  #     getFrom
  #       "https://github.com/sainnhe/capitaine-cursors/releases/download/r5/Linux.zip"
  #       "sha256-YBFM+FeQKpkHeAvc+pldYAYYzxSzf5B3ZWXJ3n5a3Ww="
  #       "Capitaine Cursors (Gruvbox)";
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  #gtk.cursorTheme.package = pkgs.capitaine-cursors-themed;
  #gtk.cursorTheme.name = "Gruvbox";

  #gtk.iconTheme.package = gruvboxPlus;
  #gtk.iconTheme.name = "GruvboxPlus";
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
     pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/debxd/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
