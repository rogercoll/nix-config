{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Roger Coll";
    userEmail = "rogercoll@protonmail.com";
  };

}
