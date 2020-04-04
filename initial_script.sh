#!/bin/bash

# mocp /home/pi/Music
# uncomment for audio player first

# vgmplayer on boot

vgmplayer(){
  cd /home/pi/Music/vgmSet
  files=(*.vgm)

  echo "files in /Music/vgmSet"

  for i in ${files[@]}
  do
    echo $i
  done
}

vgmplayer
