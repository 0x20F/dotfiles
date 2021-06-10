{ config, pkgs, ... }: 

{
	# System hostname
	networking.hostName = "palace";
	# networking.wireless.enable = true; # Wifi via 'wpa_supplicant'.
	networking.networkmanager.enable = true; # Wifi via 'networkmanager'.
	

	# Zsh setup
	programs.zsh = {
		# Enable zsh
		enable = true;

		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;


		# Make zsh export the oh-my-zsh package from nix
		# so we don't have to install it separately
		interactiveShellInit = ''
			export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
			source "$ZSH/oh-my-zsh.sh"
		'';
	};


	# Add some extra packages
	programs.zsh.ohMyZsh.customPkgs = with pkgs; [
		zsh-autosuggestions
		zsh-syntax-highlighting
	];

	
	# Enable the OpenSSH daemon.
	services.openssh.enable = true;


	# Set the time zone.
	time.timeZone = "Europe/Stockholm";


	# Internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		font ="latarcyrheb-sun32";
		keyMap = "sv-latin1";	
	};
}
