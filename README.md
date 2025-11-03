# Minegrub + World Selection (Double GRUB Theme) FIX

![OS](https://img.shields.io/badge/OS-Kali%20Linux%202025.3-blue)
![DE](https://img.shields.io/badge/Desktop-KDE%20Plasma-5b8dfc)
![Bootloader](https://img.shields.io/badge/Bootloader-GRUB2-yellow)
![Theme](https://img.shields.io/badge/Theme-Minegrub%20Double-orange)

# Overview
used the original [**Minegrub Theme by Lxtharia**](https://github.com/Lxtharia/minegrub-theme),  
but on my system there was an issue that caused only one of the two scenes (either Minegrub *or* World Selection) to appear.

If you encounter the same problem — where only one theme loads —  
you can follow this simple fix guide before proceeding with the installation steps below.  
This guide ensures both scenes (Start Menu and World Selection) appear properly.

### Installation 
Clone the Repository
```bash
git clone https://github.com/Lxtharia/double-minegrub-menu.git
cd double-minegrub-menu
````

```bash
sudo ./install.sh
```

> This script automatically installs both **Minegrub** and **Minegrub World Selection** themes
> into `/boot/grub/themes/` and sets GRUB to use them.

The installer should configure everything automatically.

# Fix Erorr

For some reason the installer only loads the *World Selection* or *Start Menu* scene:

```bash
sudo rm -rf /boot/grub/themes/kali
sudo cp -r /boot/grub/themes/minegrub-world-selection /boot/grub/themes/kali
sudo nano /etc/default/grub
```

Then edit:

```conf
GRUB_GFXMODE=auto
GRUB_TIMEOUT_STYLE=menu
GRUB_THEME="/boot/grub/themes/kali/theme.txt"
GRUB_TERMINAL_OUTPUT=gfxterm
```

Save and update:

```bash
sudo update-grub
sudo reboot
```

# Auto Fix
If you want to auto fix without complicated editing file, then you
Can directly use the `auto-fix.sh` file that I have prepared.

How to use auto-fix.sh
```bash
sudo ./install.sh #If you've done it then just skip it
chmod +x auto-fix.sh 
sudo ./auto-fix.sh
```

# Credits

* Original theme by [**Lxtharia**](https://github.com/Lxtharia/minegrub-theme)
