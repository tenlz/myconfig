{ config, pkgs, ... }:

{
  

   virtualisation.oci-containers.containers = {
      qbitorrent = {
        image = "ghcr.io/linuxserver/qbittorrent";
        autoStart = true;
        environment = {
           TZ = "Asia/Shanghai";
           PUID = "1000";
           PGID = "1000";
           WEBUI_PORT = "8999";
        };
        ports = [ "8999:8999" ]; #server locahost : docker localhost
        volumes = [
           "/home/shmily/data:/data"
           "/home/shmily/data/qbittorrent:/config"
        ];

        extraOptions = [
           "--pull=newer" # Pull if the image on the registry is newer than the one in the local containers storage
           "--name=qbittorrent"
           "--hostname=qbittorrent"
         ];       
      };
    };

}
