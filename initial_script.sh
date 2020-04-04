#!/bin/bash

# mocp /home/pi/Music
# uncomment for audio player first

# vgmplayer on boot

vgmplayer(){
  cd /home/pi/Music/vgmSet
  files=(*.vgm)
  count=0

  echo ""
  echo "files in /Music/vgmSet" 
  echo ""

  for i in ${files[@]}
  do
    echo $count $i
    ((count++))
  done

  echo ""
}

vgmplayer
