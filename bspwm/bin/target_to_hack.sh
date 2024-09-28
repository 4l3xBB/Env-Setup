#!/usr/bin/env bash

extractData ()
{
  local -- _IP= _machineName= _targetFile=/home/al3xbb/.config/bin/target

  [[ -s $_targetFile ]] || {

    printf "%%{F#e51d0b}󰓾 %%{u-}%%{F#ffffff} No target\n"
  }

  while IFS=: read -r _IP _machineName
  do
    printf "%%{F#e51d0b}󰓾 %%{F#ffffff}%s%%{u-} - %s\n" "$_machineName" "$_IP"

  done < "$_targetFile"
}

extractData
