{
  config,
  lib,
  ...
}: {
  system.autoUpgrade = {
    enable = true;
    flake = "github:/tenlz/myconfig";
    allowReboot = true;
    dates = "07:00";
    randomizedDelaySec = "30min";
    flags = ["--refresh"];
  };
  }
