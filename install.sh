sudo apt-get install python-dev -y
sudo apt-get install python-numpy -y
sudo apt-get install gstreamer1.0-tools gstreamer1.0-alsa \
gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-libav -y

#install opencv
sudo apt-get install build-essential cmake pkg-config
# Some general development libraries
sudo apt-get install -y build-essential make cmake cmake-curses-gui g++
# libav video input/output development libraries
sudo apt-get install -y libavformat-dev libavutil-dev libswscale-dev
# Video4Linux camera development libraries
sudo apt-get install -y libv4l-dev
# Eigen3 math development libraries
sudo apt-get install -y libeigen3-dev
# OpenGL development libraries (to allow creating graphical windows)
sudo apt-get install -y libglew1.6-dev
# GTK development libraries (to allow creating graphical windows)
sudo apt-get install -y libgtk2.0-dev
# GUI CMAKE
sudo apt-get install cmake-curses-gui
cd ~
mkdir src
cd src
unzip ~/Downloads/opencv-3.1.0.zip
cd opencv-3.1.0
mkdir build
cd build
ccmake ..
