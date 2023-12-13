{
  config,
  lib,
  pkgs,
  ...
}:{
  security.acme = {
  acceptTerms = true;
  defaults.email = "shmily@gmail.com";
  certs."www.tenl.vip" = {
    dnsProvider = "inwx";
    # Suplying password files like this will make your credentials world-readable
    # in the Nix store. This is for demonstration purpose only, do not use this in production.
    credentialsFile = "${pkgs.writeText "inwx-creds" ''
      INWX_USERNAME=xxxxxxxxxx
      INWX_PASSWORD=yyyyyyyyyy
    ''}";
  };
};
