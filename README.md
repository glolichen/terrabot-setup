# TerraBot Setup
For the Peddie School of Excellence

## Setup
1. Use `sudo visudo` to add `Defaults    timestamp_timeout=300` to sudoers file
2. `wget https://raw.githubusercontent.com/glolichen/terrabot-setup/main/setup.sh` to `/home/robotanist`
3. `chmod +x setup.sh`
4. `./setup.sh`

## Camera Setup
1. `wget https://raw.githubusercontent.com/glolichen/terrabot-setup/main/camera_setup_pt1.sh`
2. `wget https://raw.githubusercontent.com/glolichen/terrabot-setup/main/camera_setup_pt2.sh`
3. `chmod +x camera_setup_pt*`
4. `./camera_setup_pt1.sh`
5. Reboot
6. `./camera_setup_pt2.sh`

## GitHub
1. `ssh-keygen -t rsa -b 4096 -C "your email here"`
2. `eval $(ssh-agent -s)`
3. `ssh-add ~/.ssh/id_rsa`
4. Need to copy the content of ~/.ssh/id_rsa.pub to your Github. Unfortunately it's really long so you can transfer it to your computer by USB and copy it.
5. Insert your USB
6. `sudo mkdir /media/usb/`
7. `sudo mount /dev/sda1 /media/usb/` (the usb may not actually be `/dev/sda1`, use `cfdisk` to check)
8. `sudo cp ~/.ssh/id_rsa.pub /media/usb/`
9. `sudo umount /media/usb/`
10. Remove the USB and give the USB to Jayden Li
11. On his computer, Jayden Li will copy the contents of `id_rsa.pub`, open [https://github.com/settings/keys](https://github.com/settings/keys), click New SSH Key, Paste, then press Add SSH Key
12. You are now authenticated to push code to his account.
13. On the TerraBot, `ssh -T git@github.com` to make sure it works
14. Navigate to the TerraBot directory
15. `git remote set-url origin git@github.com:glolichen/TerraBot.git`
16. You can now push
