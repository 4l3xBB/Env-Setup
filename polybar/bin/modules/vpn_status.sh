#!/usr/bin/env bash

checkVPNiface ()
{
  local -- _vpnIface=$( /usr/sbin/ifconfig tun0 &> /dev/null )

  if [[ -n $_vpnIface ]] ; then
    printf "%%{F#1bbf3e}󰆧 %%{F#ffffff}$( /usr/sbin/ifconfig tun0 | awk '/inet\s/ { print $2 }' )%%{u-}\n"
  else
    printf "%%{F#1bbf3e}󰆧 %%{u-} Disconnected\n"
  fi
}

checkVPNiface
