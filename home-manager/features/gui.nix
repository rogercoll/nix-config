{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # TODO: add hyprland
      wl-clipboard
      vlc
    ];
  };
}
