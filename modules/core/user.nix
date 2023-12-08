{ pkgs
, inputs
, ...
}:
let
  name = "Peter Bouchard";
  username = "zell";
  email = "zell";
  initialPassword = "Newcomer2023";
  packages = with pkgs; [
    fish
  ];
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
  };

  users.users.${username} = {
    isNormalUser = true;
    initialPassword = initialPassword;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  users.users.root.initialPassword = initialPassword;
  # services.getty.autologinUser = "zell";
  nix.settings.allowed-users = [ "zell" ];
}
