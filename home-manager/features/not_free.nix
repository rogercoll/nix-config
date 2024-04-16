{ pkgs, ... }:

let
  # Define a predicate function to allow specific unfree packages by their names.
  allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    # Instead of specifying the version, just use the package name.
    # This makes the configuration more resilient to version changes.
    "spotify"
    "slack"
  ];
in
{
  # Use the 'allowUnfreePredicate' function to selectively allow unfree packages.
  nixpkgs.config = {
    allowUnfreePredicate = allowUnfreePredicate;
  };

  # Define the packages to be installed for the user environment.
  home.packages = with pkgs; [
    spotify
    slack
  ];
}

