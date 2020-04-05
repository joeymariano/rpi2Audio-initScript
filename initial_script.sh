#!/bin/bash

# mocp /home/pi/Music
# uncomment for audio player first

# vgmplayer on boot

cd /home/pi/Music/vgmSet
files=(*.vgm)
count=0
ans=""
end=false

listTracks(){
  count=0
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
  read -n 2 -p "pleez select your track: "
  echo ""

  if [[ $REPLY == "q" ]]
  then
    end=true
  else
    if [[ $REPLY =~ [0-9] ]] && [[ ${#files[@]} > $REPLY ]]
    # check if num w/regex && check if file array length is larger than number
    then
      ans=REPLY
    else
      selectTrack
    fi
  fi
}

playTrack(){
  vgmplay ${files[ans]}
}

while :
do
  listTracks
  selectTrack

  if [[ $end == true ]]
  then
    break
  else
    playTrack
  fi
done
