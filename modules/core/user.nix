{ pkgs
, inputs
, ...
}:
let
  name = "Peter Bouchard";
  username = "zell";
  email = "zell992004@gmail.com";
  initialPassword = "Newcomer2023";
  #packages = with pkgs; [
  #  fish
  #];

  name2 = "Airyana Bouchard";
  username2 = "airyanna";
  email2 = "airyannbouchard3@gmail.com";

  #TODO setup home2 home-manager
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
      home.stateVersion = "22.11";
      programs.home-manager.enable = true;
    };
    users.${username2} = {
      imports = [ (import ./../home2) ];
      home.username = username2;
      home.homeDirectory = "/home/${username2}";
      home.stateVersion = "22.11";
      programs.home-manager.enable = true;
      initialPassword = initialPassword;
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
    };
  };

  users.users.root.initialPassword = initialPassword;
  # services.getty.autologinUser = "zell";
  nix.settings.allowed-users = [ "zell" ];
}
