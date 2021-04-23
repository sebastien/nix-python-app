{ pkgs ? import <nixpkgs> {} } :

# We make a shell that uses our `package.nix` as a build input and we
# inherit the default nixpkgs setup. Note that we're not pinning `nixpkgs`
# to a particular version here.
#
# You can run this with `nix-shell shell.nix` and then the environment
# will be setup, you can then run `python -m nixpythonapp`
pkgs.mkShell {
  buildInputs = [ ((import ./package.nix) { pkgs = pkgs; }) ];
}
