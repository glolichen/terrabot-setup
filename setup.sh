#!/bin/bash
sudo apt -y install dphys-swapfile
sudo echo "CONF_SWAPFILE=/var/swap" >> /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

sudo systemctl enable ssh
sudo systemctl start ssh

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install python3 python3-pip git
sudo apt -y install python-is-python3
sudo apt -y install vlc
pip install matplotlib tmux transitions scikit-learn opencv-python

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt -y/sources.list.d/ros-latest.list'
sudo apt -y install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt -y-key add -
sudo apt -y install build-essential arduino arduino-mk
sudo apt -y install ros-noetic-rosserial ros-noetic-rosserial-arduino
echo "source /opt/ros/noetic/setup.bash" | ~/.bashrc
source ~/.bashrc

mkdir Desktop/
cd Desktop/
git clone https://github.com/reidgs/TerraBot
cd $HOME
ln -s Desktop/TerraBot .
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "export TB_DIR=${HOME}/Desktop/TerraBot" >> ~/.bashrc
echo "export export PYTHONPATH=${PYTHONPATH}:${TB_DIR}:${TB_DIR}/lib/:${TB_DIR}:${TB_DIR}/agents/" >> ~/.bashrc
source ~/.bashrc

ln -s Desktop/TerraBot .
mkdir ~/Arduino
mkdir ~/Arduino/libraries
cd ~/Arduino/libraries
rosrun rosserial_arduino make_libraries.py .
git clone https://github.com/RobTillaart/DHT20
git clone https://github.com/RobTillaart/HX711
git clone https://github.com/RobTillaart/TCA9548
git clone https://github.com/RobTillaart/dhtnew
sudo usermod -a -G dialout,robotanist $USER
sudo usermod -a -G dialout robotanist

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/arduino-cli/bin/ sh
echo "export PATH=$PATH:/home/robotanist:/home/robotanist/.local/bin/:/root/.local/bin/:/home/robotanist/arduino-cli/bin/" | ~/.bashrc
source ~/.bashrc

arduino-cli config init
arduino-cli core update-index
arduino-cli core install arduino:avr
arduino-cli compile --fqbn arduino:avr:mega ArduinoCode.ino
arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:mega ArduinoCode.ino

pip install ortools

cd /home/robotanist/.local/lib/
sudo cp -r python3.8/site-packages/* /usr/lib/python3/dist-packages/.
sudo rm -rf python3.8

cd ~/Desktop/TerraBot
