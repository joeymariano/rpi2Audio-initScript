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

  # need to handle errors here
  # if detect q exit program
  # if not a valid  number select again

  if [[ $REPLY == "q" ]]
  then
    end=true
  fi

#  if [ $ans > ${#files[@]} ]
#  then
#    echo eRr0r
#    echo
#    selectTrack
#  fi

  echo ""
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
