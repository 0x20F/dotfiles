![GitHub Dotfiles Logo](http://i.imgur.com/4jOz46V.png)

# Things needed for all configs to work
- i3-gaps
- i3lock
- rofi
- termite
- feh
- font-awesome
- polybar
- termite terminal
- arc-dark (the gtk theme)


# Installed things for my basic Arch config...

- paper-icons
- git
- lxappearance
- make
- base-devel
- kmix (for sound)
- yaourt
- GPU Drivers
- compton
- grub-customizer
- thunar
- tumbler (for thumbnails in thunar)
- chrome-beta
- discord

# Good information to remember
### Termite Config file
    cp /etc/xdg/termite/config ~/.config/termite/config

### Yaourt install
```
sudo nano /etc/pacman.conf

[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

sudo pacman -Sy yaourt
```

### Setting keyboard layout (to swedish)
```
localectl set-locale LANG="sv_SE.UTF-8"
localectl set-keymap se
localectl set-x11-keymap se
```

# Libraries to install
- libc++ (needed for discord and more, probably)
  - http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/ (will help)
