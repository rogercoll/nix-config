{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "neck";
  home.homeDirectory = "/home/neck";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./features/dev
    ./features/zsh
    ./features/gui.nix
    ./features/git.nix
    ./features/tmux.nix
    ./features/fzf.nix
    ./features/terminal.nix
    ./features/browser.nix
    ./features/not_free.nix
  ];

 # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Nerd fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.fontconfig
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
