#!/usr/bin/env bash

# Reset the keyboard driver and USB mouse 
        
modprobe -r atkbd
modprobe atkbd reset=1
echo "Finished resetting the keyboard."


# Reset all USB human interface devices

# I don't know much about the USB protocol but
# I have tried a keyboard, a mouse and a stick.
# All of them showed up as one device with the driver /sys/bus/usb/drivers/usb
# containing one or more devices with the expected driver
# /sys/bus/usb/drivers/usbhid or /sys/bus/usb/drivers/usb-storage.
# After resetting the HID only the keyboard did not work.
# I needed to reset the parent device, too.

reset_device()
{
    local dev="$1"
    echo "Resetting USB device $dev"
    echo 0 > "$dev/authorized"
    echo 1 > "$dev/authorized"
}

reset_parent_device()
{
    local hid="$1"
    local usb="${hid%:*}"
    reset_device "$usb"
}

for USB in /sys/bus/usb/devices/*; do
    if [ "`realpath "$USB/driver"`" = '/sys/bus/usb/drivers/usbhid' ]; then
        reset_device "$USB"
        reset_parent_device "$USB"
    fi
done
echo "Finished resetting USB inputs."
