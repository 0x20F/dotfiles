{ config, pkgs, ... }:

{
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
}
