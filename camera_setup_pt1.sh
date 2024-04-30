sudo echo "start_x=1" >> /boot/firmware/config.txt
sudo echo "gpu_mem=512" >> /boot/firmware/config.txt
sudo echo "disable_camera_led=1" >> /boot/firmware/config.txt
sudo echo "start_file=start_4x.elf" >> /boot/firmware/config.txt
sudo echo "fixup_file=fixup_4x.dat" >> /boot/firmware/config.txt
sudo apt -y update
sudo apt -y upgrade
sudo reboot
