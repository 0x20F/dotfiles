![GitHub Dotfiles Logo](http://i.imgur.com/4jOz46V.png)

# Installed things

- i3-gaps
- rofi
- i3lock
- polybar
- arc-dark (gtk-engine-murrine [on arch])
- paper-icons
- arc-dark-firefox
- font awesome
- feh
- git
- lxappearance
- termite terminal
- make
- pywal
- base-devel
- kmix (for sound)
- yaourt
- GPU Drivers
- compton
- grub-customizer
- thunar
- tumbler (for thumbnails in thunar)

# Good information to remember
## Termite Config file
    cp /etc/xdg/termite/config ~/.config/termite/config

## Yaourt install
```
sudo nano /etc/pacman.conf

[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

sudo pacman -Sy yaourt
```

## Setting keyboard layout (to swedish)
```
localectl set-locale LANG="sv_SE.UTF-8"
localectl set-keymap se
localectl set-x11-keymap se
```

# Libraries to install
- libc++ (needed for discord and more, probably)
  - http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/ (will help)
