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
      lua-language-server
      yaml-language-server
      stern
      gcc
      gnumake
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      rr
    ];
}
