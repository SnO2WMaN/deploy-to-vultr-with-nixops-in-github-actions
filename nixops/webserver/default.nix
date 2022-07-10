{
  config,
  resources,
  pkgs,
  ...
}: let
  secrets = builtins.fromJSON (builtins.readFile ../secrets.json);
in {
  imports = [
    ../profiles/vultr.nix
  ];

  deployment = {
    targetHost = secrets.hosts.webserver.host;
    targetPort = secrets.hosts.webserver.port;
  };

  networking.hostName = "webserver";

  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
  };
}
