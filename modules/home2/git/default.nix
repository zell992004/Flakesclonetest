{ pkgs, ... }: {
  programs.git.enable = true;
  programs.git.userName = "Peter Bouchard";
  programs.git.userEmail = "zell992004@gmail.com";
  home.packages = [ pkgs.gh ];
}
