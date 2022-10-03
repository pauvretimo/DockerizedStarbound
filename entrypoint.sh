#!/usr/bin/env bash

steamsetup="/home/steamcmd/steamcmd.sh"
server="/home/steamcmd/starbound/linux/starbound_server"

if [ "$1" = "setup" ]; then
  $steamsetup " +force_install_dir ./starbound +login $2 $3 +app_update 211820 +quit"
  
fi

if [ "$1" = "update" ]; then
  $steamsetup " +force_install_dir ./starbound +login $2 $3 +app_update 211820 validate +quit"
fi

$server
