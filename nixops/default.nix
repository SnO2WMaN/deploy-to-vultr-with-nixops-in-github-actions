{nixpkgs, ...}: {
  inherit nixpkgs;

  network = {
    storage.memory = {};
  };

  defaults = {...}: {
  };

  webserver = {
    config,
    resources,
    pkgs,
    ...
  }: {
    deployment = {
      targetHost = "";
      targetPort = 22; # 22;
    };

    system = {
      stateVersion = "21.11";
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      };
    };

    swapDevices = [
      {
        device = "/dev/disk/by-label/swap";
      }
    ];

    boot.loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/vda";
    };

    networking = {
      hostName = "webserver";
      useDHCP = false;

      interfaces.enp1s0.useDHCP = true;
    };

    networking.firewall.allowedTCPPorts = [80 443];
    services.nginx = {
      enable = true;
    };
  };
}
