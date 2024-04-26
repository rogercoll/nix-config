{
  lib,
  pkgs,
  ...
}: {
  ## Main features
  imports = [
    ./go.nix
    ./rust.nix
    ./python.nix
  ];

  ## Other packages
  home.packages = with pkgs;
    [
      lua-language-server
      yaml-language-server
      pyright #Python language server
      stern
      gcc
      gnumake


      wishlist
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      rr
    ];
}
