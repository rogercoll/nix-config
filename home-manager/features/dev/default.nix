{
  lib,
  pkgs,
  ...
}: {
  ## Main features
  imports = [
    ./go.nix
    ./rust.nix
  ];

  ## Other packages
  home.packages = with pkgs;
    [
      stern
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      rr
    ];
}
