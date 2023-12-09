{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  security.acme = {
    acceptTerms = true;

    email = "shmily@gmail.com";
  };

  services.nginx.virtualHosts = let
    SSL = {
      enableACME = true;
      forceSSL = true;
    }; in {
      "tenl.vip" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8080/";

        serverAliases = [
          "www.tenl.vip"
        ];
      });

      "jellyfin.tenl.vip" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8081/";
      });
    };
}

