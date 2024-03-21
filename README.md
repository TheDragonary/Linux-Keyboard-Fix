# Linux Keyboard Fix

UPDATE: Use the fix here instead. This actually works.

https://github.com/mistine/i8042-keyboard-fix-linux

<hr>

Fix for keyboard not working after suspend in Linux distros

This is a common problem with Sony VAIO laptops on Linux and this script aims to fix that.

Update(14/11/2023): The script may not work anymore. Also found out that this isn't just a problem with Arch and Arch-based distros but on other Linux distros too such as Debian, Ubuntu and Fedora. For now the only fix is, right after waking up from suspend, press the Caps Lock button (do NOT press any other button) until the LED light turns on, then your keyboard should be working normally after that.

## Instructions
Clone the repo
```
git clone https://github.com/TheDragonary/Arch-Keyboard-Fix.git && cd Arch-Keyboard-Fix
```
and run
```
./arch-keyboard-fix.sh
```
WARNING: note that the current working directory must be the directory where `arch-keyboard-fix.sh` and the other files are located.

Or you can execute all commands at once:
```
git clone https://github.com/TheDragonary/Arch-Keyboard-Fix.git && cd Arch-Keyboard-Fix && ./arch-keyboard-fix.sh && cd && rm -rf ~/Arch-Keyboard-Fix
```

## How it works

The fix involves three files:

- [arch-keyboard-fix.sh](arch-keyboard-fix.sh) is the installation script.
  It copies [reset-input-devices-after-sleep.service](reset-input-devices-after-sleep.service) and [reset-input-devices.sh](reset-input-devices.sh) where they belong.
- [reset-input-devices-after-sleep.service](reset-input-devices-after-sleep.service) is a [systemd](https://wiki.archlinux.org/title/systemd) [service file](https://wiki.archlinux.org/title/systemd#Writing_unit_files).
  It executes [reset-input-devices.sh](reset-input-devices.sh) after every suspend/hibernate.
- [reset-input-devices.sh](reset-input-devices.sh) resets
  - the [atkbd](https://www.kernel.org/doc/html/latest/input/input.html#atkbd) Linux kernel which is responsible for the built-in keyboard of laptops.
  - all [USB human interface devices](https://en.wikipedia.org/wiki/USB_HID).
