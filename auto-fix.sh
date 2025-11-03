#!/bin/bash

echo ""
echo "Applying automatic GRUB theme fix..."
sleep 1

# Step 1: Remove default Kali theme
if [ -d "/boot/grub/themes/kali" ]; then
  echo "Removing old Kali theme..."
  sudo rm -rf /boot/grub/themes/kali
fi

# Step 2: Copy Minegrub World Selection as default GRUB theme
if [ -d "/boot/grub/themes/minegrub-world-selection" ]; then
  echo "Copying Minegrub World Selection to /boot/grub/themes/kali ..."
  sudo cp -r /boot/grub/themes/minegrub-world-selection /boot/grub/themes/kali
else
  echo "Error: minegrub-world-selection folder not found!"
  echo "Make sure you ran ./install.sh first."
  exit 1
fi

# Step 3: Configure GRUB
echo "Configuring /etc/default/grub ..."
sudo sed -i '/^GRUB_GFXMODE=/d' /etc/default/grub
sudo sed -i '/^GRUB_TIMEOUT_STYLE=/d' /etc/default/grub
sudo sed -i '/^GRUB_THEME=/d' /etc/default/grub
sudo sed -i '/^GRUB_TERMINAL_OUTPUT=/d' /etc/default/grub

sudo tee -a /etc/default/grub > /dev/null <<EOL
GRUB_GFXMODE=auto
GRUB_TIMEOUT_STYLE=menu
GRUB_THEME="/boot/grub/themes/kali/theme.txt"
GRUB_TERMINAL_OUTPUT=gfxterm
EOL

# Step 4: Update GRUB
echo "Updating GRUB configuration..."
sudo update-grub

# Step 5: Finish
echo ""
echo "GRUB theme fix applied successfully!"
echo "Your Minegrub + World Selection theme should now work perfectly!"
echo ""
read -p "Press ENTER to reboot now or Ctrl+C to cancel..."
sudo reboot
