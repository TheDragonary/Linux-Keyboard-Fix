#! /bin/bash
sudo cp reset-input-devices.sh /usr/local/bin/
sudo cp reset-input-devices-after-sleep.service /etc/systemd/system/

sudo chown root:root /usr/local/bin/reset-input-devices.sh
sudo chmod 744 /usr/local/bin/reset-input-devices.sh

systemctl enable --now /etc/systemd/system/reset-input-devices-after-sleep.service

echo "Fix complete!"
