{ config, pkgs, ... }:

{
    environment.variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };

	# Enable the X11 windowing system
	services.xserver = {
		enable = true;
		autorun = true;
		
		layout = "se";		

		autoRepeatDelay = 200;
		autoRepeatInterval = 25;

		desktopManager = {
			xterm.enable = false;
        };

        displayManager = {
          defaultSession = "none+bspwm";

          lightdm.greeters.gtk.cursorTheme = {
            name = "Vanilla-DMZ";
            package = pkgs.vanilla-dmz;
            size = 64;
          };
        };

		windowManager.bspwm.enable = true;

		libinput.enable = true;

        dpi = 192;
    };
    
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.enable = true;
    hardware.opengl.extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
    hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [
      vaapiIntel
    ];

	# Enable sound.
	sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    hardware.pulseaudio.package = pkgs.pulseaudioFull;
}
