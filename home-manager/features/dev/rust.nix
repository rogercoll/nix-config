{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      rustup
      cargo-watch # Watch for changes and run cargo-watch
      cargo-bloat
    ];
  };
}
