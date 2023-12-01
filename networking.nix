{ config, pkgs, ... }:
{

networking.interfaces.eth0.ipv4.addresses = [ {
  address = "192.168.1.111";
  prefixLength = 24;
} ];

networking.defaultGateway = "192.168.1.1";
networking.nameservers = [ "192.168.1.1" ];

}
