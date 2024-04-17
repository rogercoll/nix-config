# Nix configuration

Always under construction.

## Requirements

```bash
nix shell nixpkgs#home-manager
```

## Usage


```bash
sudo nixos-rebuild switch --flake .#hostname
home-manager switch --flake .#username@hostname
```
