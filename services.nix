{ config
, pkgs
, ...
}: {
  services = {
    transmission = {
      enable = true;
      package = pkgs.transmission_4;
      user = "zzzsy";
      group = "users";
      downloadDirPermissions = "755";
      home = "/home/zzzsy";
      settings = {
        download-dir = "${config.services.transmission.home}/Downloads/Transmission";
        incomplete-dir-enabled = false;
      };
    };
    };
  };
}
