{ config,lib,pkgs, ... }:
	{
      services.navidrome = {
      enable = true;
      settings = {
        Address = "127.0.0.1";
        #MusicFolder = "/home/shmily/Music";
        Port = 4533;
      };
    };
}

