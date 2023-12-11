{ pkgs
, inputs
, ...
}:
let
  name = "Peter Bouchard";
  username = "zell";
  email = "zell992004@gmail.com";
  #packages = with pkgs; [
  #  fish
  #];

  name2 = "Airyanna Bouchard";
  username2 = "airyanna";
  email2 = "airyannbouchard3@gmail.com";

in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
      imports = [ (import ./../home) ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  users.${username2} = {
      imports = [ (import ./../home2) ];
      home.username = username2;
      home.homeDirectory = "/home/${username2}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  users.users = {
    ${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    };
    ${username2} = {
    isNormalUser = true;
    description = name2;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$urOPleMCmjnCngOHJCnqL.$E4.SrQdy7JQmLrtxRTrG.I3BsmkYH1dC7aps5T/3fzD";
    };
  };

  users.users.root.initialPassword = "MONkeyfook2893!!";
  # services.getty.autologinUser = "zell";
  nix.settings.allowed-users = [ "zell" "airyanna" ];
}
