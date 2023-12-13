{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg   
  ];
  services.jellyfin.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
    8096
    8920
    ];
    allowedUDPPorts = [
      # service auto-discovery
      1900
      7359
    ];
  };
}



