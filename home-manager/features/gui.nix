{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # TODO: add hyprland
      wl-clipboard
      vlc
      kitty
      bemenu
      pavucontrol
      swaylock
      waybar
      signal-desktop
    ];
  };
}
