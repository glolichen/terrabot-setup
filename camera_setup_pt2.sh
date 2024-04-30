sudo echo "bcm2835-v4l2“ >> /etc/modules
sudo usermod -aG video $USER
sudo apt -y install v4l-utils
