{
  config,
  resources,
  pkgs,
  ...
}: let
  secrets = builtins.fromJSON (builtins.readFile ../../secrets.json);
in {
  imports = [
    ../../profiles/vultr.nix
  ];

  deployment = {
    targetHost = secrets.hosts.primary.host;
    targetPort = secrets.hosts.primary.port;
  };

  networking.hostName = "primary";

  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
  };
}
