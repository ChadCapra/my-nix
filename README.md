# Nix (Home Manager w/ flakes)

- Currently, this is specific to Nix on a chromebook, but it should work on other distributions.

## Prerequesites

Someday this will change, but for now, you must install git before starting the following steps

Then go to https://nixos.org/download/

and you will copy paste what is likely the following line:
`sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`

The above installs Nix Package Manager.  Git is now required from here:

`git clone git@github.com:ChadCapra/my-nix.git`

Next, we need to enable flakes.  First, you need to ensure the nix config directory exists, so run this command:

`mkdir -p ~/.config/nix/`

Now we can enable flakes by "echoing" the following to the nix config

`echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`

Almost there, we now need to install home-manager (using Nix channels):

`nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
`nix-channel --update`
`nix-shell '<home-manager>' -A install`

- Home Manager should be installed at this point, but there is the following suggestion from (https://github.com/Evertras/simple-homemanager/blob/main/01-install.md):

`# This must be sourced in your .bashrc or whatever shell you're using.`
`# In the future we can get home-manager to do this for us, but bootstrapping for now...`
`source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh`

