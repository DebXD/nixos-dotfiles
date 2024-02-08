# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ]; # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

nix.settings.experimental-features = ["nix-command" "flakes"];
nixpkgs.config.allowUnfree = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.loader.grub = {
  enable = true;
  device = "nodev";
  efiSupport = true;
  configurationLimit = 5;
  };
   networking.hostName = "debxd-tux"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
   #services.xserver.enable = true;
   #services.xserver.displayManager.gdm.wayland = true;
   #services.greetd.enable = true;
services.upower.enable= true;

  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  #services.xserver.displayManager.sddm.wayland.enable = true;
 #services.haveged.enable = true;
 security.pam.services.swaylock = {};
#services.xserver.displayManager.sddm.theme = "Breeze";
 # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.debxd = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "storage" "power" ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
  #     firefox
  #     tree
    # ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs;  [
     vim
     neovim-unwrapped
     kitty
     firefox-wayland
     brightnessctl
     neofetch
     git
     btop
     htop
     pipewire
     webcord
     rofi-wayland
     cava
     wget
     swaylock
     pywal
     neovide
     hyprpaper
     playerctl
     starship
     telegram-desktop
     efibootmgr
     curl
     cmatrix
     ranger
     bibata-cursors
     dunst
     upower
     gammastep
     wlogout
     greetd.tuigreet
     spotify
     lf
     cinnamon.nemo-with-extensions
     material-icons
     vimPlugins.packer-nvim
     vimPlugins.vim-packer
     luajit
     rustup
     gcc
     nodejs
     clipman
     wl-clipboard
     wl-clip-persist
     mpv
     kodi-wayland
     grim
     slurp
     feh
     wf-recorder
     pamixer
     swaynotificationcenter
     pavucontrol
     ];

     #starship
programs.starship = { enable = true;
       settings = {
         add_newline = true;
         character = {
         success_symbol = "[➜](bold green)";
         error_symbol = "[➜](bold red)";
       };
       };
       };
       #waybar
   programs.waybar = {
  enable = true;
  };
   #Fonts
   fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk
   noto-fonts-emoji
  (nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
];
   # Neovim
   #programs.neovim = {
  #enable = true;
  #defaultEditor = true;
  #};
   # Hyprland
   programs.hyprland = {
   enable = true;
   xwayland.enable = true;
   };


   sound.enable = true;
   security.rtkit.enable=true;
   services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
   jack.enable = true;
   };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   users.users."debxd".openssh.authorizedKeys.keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgs3IbcyVa7+GkVnajbQ0b+GJGEylC1cYOTYBIqcgM+i3qu2NbF0PW45q1TN86EOXpRXzh9EDU766OCoWaP7Q6slz8f6RyRegmxCia79wp4WsfyqKy/pbk+sxx+H2/4XzPNdLWTgPI/T1eTiHv7dZegCahaK5kMcdydV0qPAhRmmepRn9n7JWLDadA2rsUnQ3Y+DSrDSbfutYdifnIYryC/p5G1ivS6o6btHKutwyF+mkgc6W/PohLJ9jH5JAOTF/rCcfzn8272/BzlVavaBwdOHlPj6N8Okbm4zNNGAuOwzbj6HKutBC4xOTtaKai7lEM0jcmD54SMyzcHyWLBfYTJhVe6IBzwYtug+gdsGfJTHHjJm4qk6VeH1jpRjh5cgt4Si347fVmFMdbFKPftk6Nt9lnj5+cqGDOmNf78eNzq+/rXAM3pCzBNluJEP4kYir5/DzIfHwFTTvNZewQhQhIeQWL2Iv7cC/AVyYhmfH59KJ2kQkGNAjsdrrlIxVZ9sE= debxd" # content of authorized_keys file
  # note: ssh-copy-id will add user@your-machine after the public key
  # but we can remove the "@your-machine" part
];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # Copy the NixOS configuration file and link it from the resulting system

  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

