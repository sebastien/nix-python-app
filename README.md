# Nix Python Packaging Example

This repository contains annotated code on how to package and ship a Python
project using [Nix](https://nixos.org/). The key use case here is to
*build reproducible containers* out of a Python repository, effectively using
Nix as the packaging and image building system.

This repository comes with an [annotated Makefile](Makefile), the
[Nix package](package.nix) script, the [Nix container](container.nix) script , the [Nix shell](shell.script)
and the [Python setup.py](setup.py) script.

Here is what you can do:

- `make run-shell`: Run the application in an ad-hoc Nix environment
- `make run-container`: Run the application in a packaged container (via Docker)
- `make shell`: Get into an ad-hoc isolated Nix environment

# Requirements

- Make
- Nix
- Docker

# References

- [An illustration of a Nix Python Package](https://gist.github.com/CMCDragonkai/b2337658ff40294d251cc79d12b34224)
- [Get PYTHONPATH from pkgs.python3.withPackages](https://discourse.nixos.org/t/get-pythonpath-from-pkgs-python3-withpackages/6076/3)
