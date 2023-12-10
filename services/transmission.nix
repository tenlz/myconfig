{ config
, pkgs
, ...
}: {
  services = {
    transmission = {
      enable = true;
      package = pkgs.transmission_4;
      user = "shmily";
      group = "users";
      downloadDirPermissions = "755";
      home = "/home/shmily";
      settings = {
        download-dir = "${config.services.transmission.home}/Downloads/Transmission";
        incomplete-dir = "${config.services.transmission.home}/Downloads/Transmission/incomplete";
      };
    };   
  };
}

