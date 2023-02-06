#!/bin/bash

curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | sudo bash
sudo  apt-get install -y vpp*
