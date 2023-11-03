#! /bin/sh
# Reset the keyboard driver and USB mouse 
        
modprobe -r atkbd
modprobe atkbd reset=1
echo "Finished resetting the keyboard."
        
# Reset all USB human interface devices
for USB in /sys/bus/usb/devices/*; do
    if [ "`realpath "$USB/driver"`" = '/sys/bus/usb/drivers/usbhid' ]; then
        echo "Resetting USB human interface device $USB"
        echo 0 > "$USB/authorized"
        echo 1 > "$USB/authorized"
    fi
done
echo "Finished resetting USB inputs."
