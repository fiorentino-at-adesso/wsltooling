#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

# clean-up left overs from adoptopenjdk
if [[ -d /usr/lib/openjdk8 ]]; then
    sudo rm -fr /usr/lib/openjdk8
fi
if [[ -e /etc/profile.d/openjdk8.sh ]]; then
    sudo rm /etc/profile.d/openjdk8.sh
fi
rm -f ~/Downloads/OpenJDK8U-jdk_x64_linux_hotspot_*.tar.gz

sudo apt install -y openjdk-8-jdk

# update global path with available jvm tools
sudo cp -f ${DIR_ME}/../../config/etc/profile.d/configureJvmEnv.sh /etc/profile.d

bash /etc/profile.d/configureJvmEnv.sh
