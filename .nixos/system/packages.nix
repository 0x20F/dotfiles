{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Internet
		wget curl

		# Shell replacements
		exa bat

		# Shell tools
		vim tmux git htop
		lolcat figlet jq psmisc

		# Shell
		zsh oh-my-zsh

		# Graphical Interface
		feh rofi alacritty
		polybar scrot
	];
}
