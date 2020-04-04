#!/bin/bash

# mocp /home/pi/Music
# uncomment for audio player first

# vgmplayer on boot

cd /home/pi/Music/vgmSet
files=(*.vgm)
count=0

listTracks(){
  echo ""
  echo "files in ~/Music/vgmSet"
  echo ""

  for filename in ${files[@]}
  do
    echo $count $filename
    ((count++))
  done

  echo ""
}

selectTrack(){
  echo -n "pleez select your track: "

  read -n 1 ans

  echo ""
  echo ""

  return $ans
}

listTracks
selectTrack
