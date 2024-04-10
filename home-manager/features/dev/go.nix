{pkgs, ...}: {
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.packages = with pkgs; [
    gopls
    gomodifytags
    impl
    golangci-lint
  ];
}
