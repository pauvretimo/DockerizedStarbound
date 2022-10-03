#!/bin/bash

steamsetup="/home/steamcmd/steamcmd.sh +force_install_dir ./starbound +login "
server="/home/steamcmd/starbound/linux/starbound_server"

if [ "$1" = "setup" ]; then
  "$steamsetup $2 $3 +app_update 211820 +quit"
fi

if [ "$1" = "update" ]; then
  "$steamsetup $2 $3 +app_update 211820 validate +quit"
fi

$server
