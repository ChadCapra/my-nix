# Nix (Home Manager w/ flakes)

- Currently, this is specific to Nix on a chromebook, but it should work on other distributions.

## Prerequesites

Someday this will change, but for now, you must install git before starting the following steps

Then go to https://nixos.org/download/

and you will copy paste what is likely the following line:
```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

The above installs Nix Package Manager.  Git is now required from here:

```bash
git clone git@github.com:ChadCapra/my-nix.git
```

Next, we need to enable flakes.  First, you need to ensure the nix config directory exists, so run this command:

```bash
mkdir -p ~/.config/nix/
```

Now we can enable flakes by "echoing" the following to the nix config

```bash
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Almost there, we now need to install home-manager (using Nix channels):

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

- Home Manager should be installed at this point, but there is the following suggestion from (https://github.com/Evertras/simple-homemanager/blob/main/01-install.md):

*This must be sourced in your .bashrc or whatever shell you're using.*
*In the future we can get home-manager to do this for us, but bootstrapping for now...*
```bash
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```

### Make sure it works

Can you run this?

```bash
home-manager --version
```

## Run the flake/home manager setup for "myUser"

```bash
home-manager switch --flake .#myUser
```

Restart/`exit` the terminal and when it restarts, you should see the `nu` shell command line (it is obviously different than before, but you can confirm by typing `ls` and you will get a table instead of the typical text.
