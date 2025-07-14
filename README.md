# Nix (Home Manager w/ flakes)

- Currently, this is specific to Nix on a chromebook, but it should work on other distributions.

## Prerequesites

Someday this will change, but for now, you must install git before starting the following steps

Then go to https://nixos.org/download/

and you will copy paste what is likely the following line:
`sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`

The above installs Nix Package Manager.  Git is now required from here:

`git clone git@github.com:ChadCapra/my-nix.git`

Then finally we run a command to run the flake:

`[TBD]`
