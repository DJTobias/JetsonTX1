#!/bin/bash
# $1: cuda debian file name 
# $2: cuda_ver (example 6.0, 6.5)
# $3: cuda_dash_ver (6-0, 6-5)

if [ $# != 3 ] ; then
    echo "Incorrect arguments, use following command to install cuda"
    echo "$0 cuda_deb_file_name 6.5 6-5"
    exit 1
fi

sudo dpkg --force-all -i ~/cuda-l4t/$1
sudo sed -i.bak 's/\(^deb.*main restricted\)\s*$/\1 universe multiverse/g' /etc/apt/sources.list
sudo sed -i.bak 's/\(^deb.*main restricted universe\)\s*$/\1 multiverse/g' /etc/apt/sources.list

sudo apt-get -y update
sudo apt-get -y --force-yes install cuda-toolkit-$3 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin

grep -q "export PATH=.*/usr/local/cuda-$2/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda-"$2"/bin:$PATH">>~/.bashrc

if dpkg --print-architecture | grep -q arm64; then 
    lib_dir=lib64
else
    lib_dir=lib
fi
grep -q "export LD_LIBRARY_PATH=/usr/local/cuda-$2/$lib_dir" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda-"$2"/"$lib_dir":$LD_LIBRARY_PATH" >> ~/.bashrc
export LD_LIBRARY_PATH=/usr/local/cuda-$2/$lib_dir:$LD_LIBRARY_PATH
 
