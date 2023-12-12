{ pkgs, ... }:
{
  dconf.settings = {
  "org/gnome/desktop/interface".color-scheme = "default";
  "org/gnome/desktop/interface".cursor-theme = "Yaru";
  "org/gnome/desktop/interface".gtk-theme = "asw-gtk3-dark";
  "org/gnome/desktop/interface".icon-theme = "Yaru-dark";
  # "org/gnome/shell/extensions/user-theme".name = "Yaru-dark";
  "org/gnome/desktop/interface".font-name = "Roboto 11";
  "org/gnome/desktop/interface".document-font-name = "Roboto 11";
  "org/gnome/desktop/interface".monospace-font-name = "Iosevka 10";
  "org/gnome/desktop/wm/preferences".titlebar-font = "Roboto Bold 11";

  };
}
