{ config, pkgs, ... }:


{
	# Define user accounts. Don't forget to set a password with 'passwd'.
	users.users.snowwhite = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "wheel" "audio" "video" "networkmanager" ]; # Enable 'sudo' for the user.
	};


	system.userActivationScripts.snowwhite-vim-plug.text = ''
		mkdir -p /home/snowwhite/.vim/autoload
		rm -rf /tmp/plug

		${pkgs.git}/bin/git clone https://github.com/junegunn/vim-plug /tmp/plug

		mv /tmp/plug/plug.vim /home/snowwhite/.vim/autoload

	'';
}
