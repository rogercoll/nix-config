{ pkgs, ... }:
let
    tmux-sensible = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-sensible";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-sensible";
        rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
        sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
      };
    };
    base16-tmux = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "base16-tmux";
      version = "abc93bd53b3920569de9b7e7f747c21e1590bfad";
      src = pkgs.fetchFromGitHub {
        owner = "tinted-theming";
        repo = "base16-tmux";
        rev = "abc93bd53b3920569de9b7e7f747c21e1590bfad";
        sha256 = "sha256-DtNWFc0SSl2vSdUBlB40WWhlf+UkokvxOtOa/g/xzDY=";
      };
    };
  in
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
      '';

      plugins = with pkgs; [
        {
          plugin = tmux-sensible;
        }
        {
          plugin = base16-tmux;
          extraConfig = "set -g @colors-base16 'default-dark'";
        }
        tmuxPlugins.vim-tmux-navigator
      ];
    };
  }
