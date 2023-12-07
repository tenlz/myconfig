{
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  security.acme = {
    acceptTerms = true;

    email = "REDACTED";
  };

  services.nginx.virtualHosts = let
    SSL = {
      enableACME = true;
      forceSSL = true;
    }; in {
      "domain.tld" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8080/";

        serverAliases = [
          "www.domain.tld"
        ];
      });

      "sub.domain.tld" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8081/";
      });
    };
}

