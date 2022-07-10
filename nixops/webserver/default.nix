{
  config,
  resources,
  pkgs,
  ...
}: {
  imports = [
    ../profiles/vultr.nix
  ];

  deployment = {
    targetHost = "";
    targetPort = 22;
  };

  networking.hostName = "webserver";

  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
  };
}
