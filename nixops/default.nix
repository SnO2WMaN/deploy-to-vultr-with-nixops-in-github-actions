{nixpkgs, ...}: {
  inherit nixpkgs;

  network = {
    storage.memory = {};
  };

  defaults = {...}: {
  };

  primary = import ./hosts/primary;
}
