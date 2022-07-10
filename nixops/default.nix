{nixpkgs, ...}: {
  inherit nixpkgs;

  network = {
    storage.memory = {};
  };

  defaults = {...}: {
  };

  webserver = import ./webserver;
}
