{ pkgs ? import <nixpkgs> { system = "x86_64-linux"; } }:

let
    package = import ./package.nix { inherit pkgs; };
    # This line is adapted from [here](https://discourse.nixos.org/t/get-pythonpath-from-pkgs-python3-withpackages/6076/3),
    # but there might be a better way to do it. It creates a path that we can
    # use from the container.
    pythonPath = pkgs.python3.withPackages(pp: with pp; [ package ]);
in

  # There are quite a few useful examples of working with dockerTools in
  # here: https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix
  pkgs.dockerTools.buildImage {
    name = "nix-python-app";
    contents = [
      package
    ];
    config = {
      Cmd = [
        "${pkgs.python3}/bin/python" "-m" "nixpythonapp"
      ];
      # We will need the PYTHONPATH as Nix all the packages are spread out
      # over many directories.
      Env = [
        "PYTHONPATH=${pythonPath}/${pythonPath.sitePackages}"
      ];
    };
  }
