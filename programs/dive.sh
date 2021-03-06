#!/bin/bash
set -eoux pipefail

version=0.9.1
file=dive_${version}_linux_amd64.deb

if [[ $(id -u) != 0 ]]; then
  sudo=sudo
else
  sudo=
fi

$sudo apt-get install --no-install-recommends -qy wget
wget https://github.com/wagoodman/dive/releases/download/v$version/$file
$sudo apt-get install --no-install-recommends -qy ./$file
rm $file
