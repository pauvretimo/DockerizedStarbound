#!/usr/bin/env bash

steamsetup="/home/steamcmd/steamcmd.sh +force_install_dir ./starbound +login"
server="/home/steamcmd/starbound/linux/run_server.sh"

if [ "$1" = "setup" ]; then
  command="$steamsetup $2 $3 +app_update 211820 +quit"
  $command
fi

if [ "$1" = "update" ]; then
  command="$steamsetup $2 $3 +app_update 211820 validate +quit"
  $command
fi

/bin/bash
#$server
