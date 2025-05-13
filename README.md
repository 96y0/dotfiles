![preview](preview.png)

---

## Details

| task | name |
| --- | --- |
| wm | [Hyprland](https://github.com/hyprwm/Hyprland) |
| terminal | [kitty](https://github.com/kovidgoyal/kitty)/[wezterm]() |
| launcher | [rofi](https://github.com/davatorium/rofi) |
| editor | [neovim](https://github.com/neovim/neovim) |
| bar | [eww](https://github.com/elkowar/eww) |
| notification | [dunst](https://github.com/dunst-project/dunst) |
| file browser | [yazi](https://github.com/sxyazi/yazi) / [nemo](https://github.com/linuxmint/nemo) |
| gtk-theme | [catppucin](https://github.com/catppuccin/catppuccin) |
| font | JetBrainsMonoNF |

---

## Dependencies

#### Gentoo

> NOTE: You must have guru repo to be able to install all dependencies.
```bash
emerge --ask gui-wm/hyprland gui-libs/xdg-desktop-portal-hyprland gui-apps/hyprlock \
gui-apps/hyprshot gui-apps/eww gui-apps/wl-clipboard app-misc/yazi \
x11-terms/kitty gui-apps/rofi-wayland gui-apps/swww gnome-extra/nemo app-editors/neovim \
app-misc/brightnessctl media-sound/pulsemixer media-sound/playerctl media-sound/pavucontrol \
gui-apps/hypridle app-admin/stow
```

#### Arch
```bash
pacman -S hyprland xdg-desktop-portal-hyprland wl-clipboard yazi kitty rofi-wayland \
swww nemo neovim brightnessctl pulsemixer pavucontrol playerctl hyprlock hypridle stow 
```

```bash
paru -S eww hyprshot 

```

## Setup

1.Clone the repo
```bash
git clone https://github.com/96y0/dotfiles
cd dotfiles
```

2.Use GNU stow
```bash
stow .
```


