{config, ...}: {
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [config.deployment.targetPort];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = import ./ssh-keys.nix;
  };
}
