#!/bin/bash

steamsetup="/home/steamcmd/steamcmd.sh"
server="/home/steamcmd/starbound/linux/starbound_server"

if [ "$1" = "setup" ]; then
  $steamsetup
else
  $server
