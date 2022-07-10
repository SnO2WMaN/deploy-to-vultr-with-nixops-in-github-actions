{config, ...}: let
  secrets = builtins.fromJSON (builtins.readFile ../secrets.json);
in {
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [config.deployment.targetPort];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = secrets.ssh.known_hosts;
  };
}
