{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # TODO: add hyprland
      wl-clipboard
      vlc
      kitty
      alacritty
      bemenu
      pavucontrol
      swaylock
      waybar
      signal-desktop
      graphviz
    ];
  };
}
