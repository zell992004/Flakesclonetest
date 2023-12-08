{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "amdgpu" ];
    displayManager.autoLogin = {
      enable = true;
      user = "zell";
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
      # TODO add in gnome Desktop env
    };
  };
}
