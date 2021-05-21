{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Internet
		wget curl

		# Shell replacements
		exa bat

		# Shell tools
		vim tmux git

		# Shell
		zsh oh-my-zsh
	];
}
