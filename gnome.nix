{config,lib,pkgs
, ...
}:

{
  imports = [ ];
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];
    services.xserver.desktopManager.xterm.enable = false;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      # orca
      #]) ++ (with pkgs.gnome; [
    ]);
    programs.dconf.enable = true;
  
   # 使用 gsconnect
    programs.kdeconnect = {
      enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
     };
 

    environment.systemPackages = (with pkgs; [
      remmina
      ffmpegthumbnailer
      #amberol # music
      loupe # image
      gnome-text-editor
      gnome-console
      epiphany
      yaru-theme
      nordic
      gruvbox-gtk-theme
      adw-gtk3
      gradience
      gnomeExtensions.user-themes
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.customize-ibus
      #gnomeExtensions.quake-mode
      gnomeExtensions.fuzzy-app-search
      gnomeExtensions.blur-my-shell
      gnomeExtensions.system-monitor
      gnomeExtensions.appindicator
    ]) ++ (with pkgs.gnome; [
      nautilus # file
      file-roller # archive
      evince # pdf
      gnome-tweaks
      gnome-calendar
      dconf-editor
      seahorse
      gnome-disk-utility
      gnome-boxes
      # loupe # https://github.com/NixOS/nixpkgs/pull/202692
      # gnome-sound-recorder
      # gnome-power-manager
    ]);
  
  # Theme
  dconf.settings = {
  "org/gnome/desktop/interface".color-scheme = "default";
  "org/gnome/desktop/interface".cursor-theme = "Yaru";
  "org/gnome/desktop/interface".gtk-theme = "asw-gtk3-dark";
  "org/gnome/desktop/interface".icon-theme = "Yaru-dark";
  "org/gnome/shell/extensions/user-theme".name = "Yaru-dark";
  "org/gnome/desktop/interface".font-name = "Roboto 11";
  "org/gnome/desktop/interface".document-font-name = "Roboto 11";
  "org/gnome/desktop/interface".monospace-font-name = "Iosevka 10";
  "org/gnome/desktop/wm/preferences".titlebar-font = "Roboto Bold 11";

  };

  };
}


