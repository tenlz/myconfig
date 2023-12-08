{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg   
  ];
  services.Jellyfin.enable = true;
}



