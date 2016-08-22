#!/bin/bash

### Get user input variables
source arch-installer/user-input.txt


case $USER_LANGUAGE in
	"DE - Deutschland") 
	loadkeys de-latin1
	sed -i 's/<replace>/de/g' arch-installer/20-keyboard.conf
	echo KEYMAP=de-latin1 > arch-installer/vconsole.conf
	sed -i 's/#en_DK.UTF-8/en_DK.UTF-8/g' /mnt/etc/locale.gen
	echo LANG=en_DK.UTF-8 > arch-installer/locale.conf
	break;;

	"DE - Schweiz") 
	loadkeys sg-latin1
	sed -i 's/<replace>/ch/g' arch-installer/20-keyboard.conf
	echo KEYMAP=sg-latin1 > arch-installer/vconsole.conf
	sed -i 's/#en_DK.UTF-8/en_DK.UTF-8/g' /mnt/etc/locale.gen
	echo LANG=en_DK.UTF-8 > arch-installer/locale.conf
	break;;

	"EN - DK")
	sed -i 's/<replace>/us/g' arch-installer/20-keyboard.conf
	echo KEYMAP=us > arch-installer/vconsole.conf
	sed -i 's/#en_DK.UTF-8/en_DK.UTF-8/g' /mnt/etc/locale.gen
	echo LANG=en_DK.UTF-8 > arch-installer/locale.conf
	break;;

	"EN - US")
	sed -i 's/<replace>/us/g' arch-installer/20-keyboard.conf
	echo KEYMAP=us > arch-installer/vconsole.conf
	sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /mnt/etc/locale.gen
	echo LANG=en_US.UTF-8 > arch-installer/locale.conf
	break;;
* ) echo "Invalid input. Try again..."
	exit 1
esac


cp arch-installer/locale.conf /mnt/etc/
cp arch-installer/vconsole.conf /mnt/etc/
cp arch-installer/20-keyboard.conf /mnt/etc/X11/xorg.conf.d/



arch-chroot /mnt locale-gen