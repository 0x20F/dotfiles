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
			defaultSession = "none+i3";
		};

		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
			extraPackages = with pkgs; [
				i3lock    # Simple and clean lock screen
			];
		};
	};

	services.compton = {
		enable = true;
		shadow = true;
	};

	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
}
