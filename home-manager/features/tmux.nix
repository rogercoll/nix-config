{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-t";
    baseIndex = 1;
    mouse = true;

    # For vi mode
    keyMode = "vi";
    customPaneNavigationAndResize = true; # For vi mode
    escapeTime = 0; # We do not use ESC for any tmux keybindings

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      # Open new windows in current pane path
      bind  c  new-window      -c "#{pane_current_path}"
      bind  %  split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      # COLORIZE: https://github.com/tinted-theming/tinted-tmux/blob/main/colors/base16-default-dark.conf
      # default statusbar colors
      set-option -g status-style "fg=#b8b8b8,bg=#282828"

      # default window title colors
      set-window-option -g window-status-style "fg=#b8b8b8,bg=#282828"

      # active window title colors
      set-window-option -g window-status-current-style "fg=#f7ca88,bg=#282828"

      # pane border
      set-option -g pane-border-style "fg=#282828"
      set-option -g pane-active-border-style "fg=#b8b8b8"

      # message text
      set-option -g message-style "fg=#e8e8e8,bg=#383838"

      # pane number display
      set-option -g display-panes-active-colour "#b8b8b8"
      set-option -g display-panes-colour "#282828"

      # clock
      set-window-option -g clock-mode-colour "#7cafc2"

      # copy mode highlight
      set-window-option -g mode-style "fg=#b8b8b8,bg=#383838"

      # bell
      set-window-option -g window-status-bell-style "fg=#181818,bg=#ab4642"

      # style for window titles with activity
      set-window-option -g window-status-activity-style "fg=#d8d8d8,bg=#282828"

      # style for command messages
      set-option -g message-command-style "fg=#e8e8e8,bg=#383838"
    '';

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];
  };
}
