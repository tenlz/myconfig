{ config,pkgs, ... }:
	{
      services.navidrome = {
      enable = true;
      settings = {
        Address = "192.168.1.111";
        MusicFolder = "/shmily/media/music";
        Port = 4533;
      };
    };
}

