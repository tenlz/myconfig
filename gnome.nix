{pkgs
, ...
}:

{
  imports = [ ];
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      # orca
      #]) ++ (with pkgs.gnome; [
    ]);
    programs.dconf.enable = true;
  
    environment.systemPackages = (with pkgs; [
      remmina
      ffmpegthumbnailer
      amberol # music
      loupe # image
      gnome-text-editor
      gnome-console
      epiphany
    ]) ++ (with pkgs.gnome; [
      nautilus # file
      file-roller # archive
      evince # pdf
      gnome-tweaks
      gnome-calendar
      dconf-editor
      seahorse
      gnome-disk-utility
      # loupe # https://github.com/NixOS/nixpkgs/pull/202692
      # gnome-sound-recorder
      # gnome-power-manager
    ]);
  
 

  };
}
