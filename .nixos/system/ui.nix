{ config, pkgs, ... }:

{
	# Enable the X11 windowing system
	services.xserver = {
		enable = true;
		autorun = true;

		autoRepeatDelay = 200;
			autoRepeatInterval = 25;

		desktopManager = {
			xterm.enable = false;
		};


		displayManager = {
			defaultSession = "none+bspwm";
		};


		windowManager.bspwm.enable = true;
	};



	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
}
