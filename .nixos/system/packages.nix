{ config, pkgs, ... }:

let
  # Personal scripts that need to be global 
  custom = pkgs.callPackage ./packages-custom.nix { };
in
{
  nixpkgs.config.allowUnfree = true;

  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    custom.ix
    custom.picom

    
    # Internet
	wget curl

    
    # Shell replacements
	exa bat ripgrep fzf starship

    
    # Shell tools
	neovim tmux git htop
	lolcat figlet jq psmisc
	python3 xorg.xev xorg.xwininfo
    neofetch lsof inotify-tools
    bc unzip python39Packages.pip


	# Shell
	zsh oh-my-zsh

    
    # Libs
    glib

    
    # Graphical Interface
	feh rofi alacritty dunst
	polybar maim imagemagick
    firefox google-chrome vlc
    gnome.nautilus
    obsidian vscode
    i3lock-color discord
    papirus-icon-theme
    lxappearance arc-theme
    spotify playerctl
    wmctrl
  ];


  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })

      ubuntu_font_family
      source-code-pro
      source-sans-pro
      google-fonts
      lato
      montserrat
      dejavu_fonts
      siji
      material-design-icons
    ];
  };
}
