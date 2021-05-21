{ config, pkgs, ... }:

{
	# Define user accounts. Don't forget to set a password with 'passwd'.
	users.users.snowwhite = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
	};

}
