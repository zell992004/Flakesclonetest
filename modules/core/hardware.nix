{ pkgs, ... }: {
  # hardware.video.hidpi.enable = true;
  nixos-hardware.nixosModules.dell-xps-13-9380
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  powerManagement.cpuFreqGovernor = "performance";
}
