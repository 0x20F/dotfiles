{ config, pkgs, ... }:

let
  # Personal scripts that need to be global 
  scripts = pkgs.callPackage ./scripts.nix { };
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    scripts.ix

    # Internet
	wget curl

	# Shell replacements
	exa bat ripgrep fzf

	# Shell tools
	vim tmux git htop
	lolcat figlet jq psmisc
	python3 xorg.xev xorg.xwininfo

	# Shell
	zsh oh-my-zsh

	# Libs
	glib

	# Graphical Interface
	feh rofi alacritty dunst
	polybar picom maim imagemagick
	firefox-devedition-bin-unwrapped
	# google-chrome - add later, it's 64bit, windows VM won't run that
	vlc
	xfce.thunar xfce.gvfs xfce.tumbler
	# obsidian - add later, it's 64bit, windows VM won't run that
    i3lock-color
    # vscode
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })

      ubuntu_font_family
      source-code-pro
      source-sans-pro
      dejavu_fonts
      font-awesome-ttf
      siji
    ];
  };
}
