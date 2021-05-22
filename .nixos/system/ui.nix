{ config, pkgs, ... }:

{
	# Enable the X11 windowing system
	services.xserver = {
		enable = true;
		autorun = false;

		desktopManager = {
			xterm.enable = false;
		};

		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
			extraPackages = with pkgs; [
				rofi	 # Application launcher/custom menus
				i3lock   # Simple and clean lock screen
				compton  # Compositor (window shadows and transparency)
				polybar  # Highly customisable menu bar
			];
		};
	};

	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
}
