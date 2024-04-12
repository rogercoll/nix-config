{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      unzip
      bash
      wget
      neofetch
      lsd # fancy ls
      ripgrep # fancy grep
      fd # fancy find
      hyperfine  # A command-line benchmarking tool
      bat # fancy cat
      neovim
      htop
      stow
      kmon # A fancy kernel dashboard
    ];
  };

# let
#    tmux-sensible = pkgs.tmuxPlugins.mkTmuxPlugin
#     {
#       pluginName = "tmux-sensible";
#       src = pkgs.fetchFromGithub {
#         owner = "tmux-plugins";
#         repo = "tmux-sensible";
#       };
#     };
#   in
#   {
#     programs.tmux = {
#       enable = true;
#       prefix = "C-t";
#       baseIndex = 1;
#       mouse = true;
#
#       # For vi mode
#       keyMode = "vi";
#       customPaneNavigationAndResize = true; # For vi mode
#       escapeTime = 0; # We do not use ESC for any tmux keybindings
#
#       extraConfig = ''
#         set-option -sa terminal-overrides ",xterm*:Tc"
#         # Open new windows in current pane path
#         bind  c  new-window      -c "#{pane_current_path}"
#         bind  %  split-window -h -c "#{pane_current_path}"
#         bind '"' split-window -v -c "#{pane_current_path}"
#       '';
#
#       plugins = with pkgs.tmuxPlugins; [
#         tmuxPlugins.tmux-sensible
#         vim-tmux-navigator
#         # {
#         #   plugin = base16-tmux;
#         #   extraConfig = "set -g @colors-base16 'default-dark'";
#         # }
#       ];
#     };
#   }
#
}
