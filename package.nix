{ pkgs ? import <nixpkgs> {}  }:

# SEE:  https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md
pkgs.python3Packages.buildPythonPackage {
  pname = "nix-python-app";
  src = ./.;
  version = "0.0";
  propagatedBuildInputs = [
    pkgs.python38
    pkgs.python38Packages.aiohttp
    pkgs.python38Packages.pytz
  ];
}
