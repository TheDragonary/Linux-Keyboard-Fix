# Arch Keyboard Fix
Fix for keyboard not working after suspend in Arch Linux and Arch-based distros

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
