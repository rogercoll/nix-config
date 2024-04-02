{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    shellAliases = import ./aliases.nix;
    history = {
      extended = true;
      expireDuplicatesFirst = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins =
        [
          "aws"
          "cp"
          "docker"
          "docker-compose"
          "fd"
          "gh"
          "git"
          "git-auto-fetch"
          "git-extras"
          "github"
          "gitignore"
          "golang"
          "helm"
          "history"
          "kubectl"
          "minikube"
          "nmap"
          "ripgrep"
          "rust"
          "terraform"
          "tmux"
        ];
    };

    sessionVariables = {
      KEYTIMEOUT = 1;
      DOTFILES = "$HOME/config/.dotfiles";
      NVIM_TUI_ENABLE_TRUE_COLOR = 1;
      EDITOR = "nvim";
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
      ZSH_AUTOSUGGEST_STRATEGY = ["history" "completion"];
    };


    initExtraBeforeCompInit = ''
      ${builtins.readFile ./functions.zsh}

      bindkey -M vicmd 'k' history-beginning-search-backward
      bindkey -M vicmd 'j' history-beginning-search-forward
    '';
  };

}
