{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      neofetch
      lsd # fancy ls
      ripgrep # fancy grep
      fd # fancy find
      hyperfine  # A command-line benchmarking tool
      bat # fancy cat
      neovim
    ];
  };
}
