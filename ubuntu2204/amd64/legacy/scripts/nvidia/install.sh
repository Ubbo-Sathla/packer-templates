#!/bin/bash
set -x


PYTHON_HOME=/usr/local/python
CUDA_HOME=/usr/local/cuda

MINICONDA=Miniconda3-py38_23.11.0-2-Linux-x86_64.sh
NVIDIA=NVIDIA-Linux-x86_64-535.146.02.run
CUDA=cuda_12.1.1_530.30.02_linux.run

wget -q -O /tmp/$MINICONDA  http://10.127.252.101/dav/gpu/$MINICONDA
wget -q -O /tmp/$NVIDIA  http://10.127.252.101/dav/gpu/$NVIDIA
wget -q -O /tmp/$CUDA  http://10.127.252.101/dav/gpu/$CUDA

chmod +x /tmp/$MINICONDA
chmod +x /tmp/$NVIDIA
chmod +x /tmp/$CUDA

sudo /tmp/$NVIDIA  --disable-nouveau --dkms --silent
sudo /tmp/$CUDA --silent
sudo /tmp/$MINICONDA   -b -p $PYTHON_HOME



export PATH="$CUDA_HOME/bin:$PYTHON_HOME/bin:$PATH"
echo 'PYTHON_HOME=/usr/local/python' | sudo tee -a /etc/profile.d/conda.sh
echo 'CUDA_HOME=/usr/local/cuda' | sudo tee -a /etc/profile.d/conda.sh
echo 'export PATH="$CUDA_HOME/bin:$PYTHON_HOME/bin:$PATH"' | sudo tee -a /etc/profile.d/conda.sh

echo '
channels:
  - defaults
show_channel_urls: true
default_channels:
  - http://mirrors.aliyun.com/anaconda/pkgs/main
  - http://mirrors.aliyun.com/anaconda/pkgs/r
  - http://mirrors.aliyun.com/anaconda/pkgs/msys2
custom_channels:
  conda-forge: http://mirrors.aliyun.com/anaconda/cloud
  msys2: http://mirrors.aliyun.com/anaconda/cloud
  bioconda: http://mirrors.aliyun.com/anaconda/cloud
  menpo: http://mirrors.aliyun.com/anaconda/cloud
  pytorch: http://mirrors.aliyun.com/anaconda/cloud
  simpleitk: http://mirrors.aliyun.com/anaconda/cloud
' | sudo tee -a /root/.condarc

sudo su - root  -c " $PYTHON_HOME/bin/conda  install -y pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia "
sudo su - root  -c " $PYTHON_HOME/bin/conda  install -y  -c anaconda tensorflow-gpu "