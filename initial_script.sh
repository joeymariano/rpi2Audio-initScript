#!/bin/bash

# mocp /home/pi/Music
# uncomment for audio player first

# vgmplayer on boot

# change dir and setup variables
cd /home/pi/Music/vgmSet
files=(*.vgm) # load all files into array
count=0
ans=""
end=false

# colors for echo
LCYAN="\033[1;36m"
LPURPLE="\033[1;35m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LGREEN="\033[1;32m"
NC="\033[0m"

listTracks(){
  count=0
  echo ""
  echo -e "${PURPLE}files in ${LPURPLE}~/Music/vgmSet${NC}\n"

  for filename in ${files[@]}
  do
    echo -e $CYAN$count$NC $LCYAN$filename$NC
    ((count++))
  done

  echo ""
}

selectTrack(){
  echo -n -e "${PURPLE}pleez select your ${LPURPLE}track: ${LGREEN}"
  read -n 2
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
