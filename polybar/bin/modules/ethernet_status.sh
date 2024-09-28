#!/usr/bin/env bash

printf "%%{F#2495e7}󰈀 %%{F#ffffff}$( /usr/sbin/ifconfig ens33 | awk '/inet\s/ { print $2 }' )%%{u-}\n"
