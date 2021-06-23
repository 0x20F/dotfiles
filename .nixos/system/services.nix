{ pkgs, ... }:

let 
  custom = import ./packages-custom.nix { };
in
{
  systemd.services.wakelock = {
    wantedBy = [ "sleep.target" "suspend.target" ];
    after = [ "sleep.target" "suspend.target" ];
    description = "Lock the screen before going to sleep";
    environment = { 
      DISPLAY = ":0";
    };
    path = with pkgs; [
      xorg.xrandr
      custom.ix
      i3lock-color
      gnused
      gnugrep
      gawk
      coreutils
      imagemagick
    ];

    serviceConfig = {
      Type = "forking";
      User = "snowwhite";
      ExecStart = "/home/snowwhite/dots/.scripts/lock/lock-screen";
    };
  };
}
