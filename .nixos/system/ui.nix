{ config, pkgs, ... }:

{
    environment.variables = {
      GDK_SCALE = "1";
      GDK_DPI_SCALE = "0.7";
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

        dpi = 290;

		#videoDrivers = [ "nvidia" ];
	};



	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
}
