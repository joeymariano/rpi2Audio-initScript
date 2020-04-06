#!/bin/bash

# mocp /home/pi/Music
# uncomment this line
# and comment out the last
# for audio player instead

# vgmplayer on boot

# clear screen, change dir, and setup variables
clear
cd /home/pi/Music/vgmSet
files=(*.vgm) # load all filenames into array
count=0
ans=""
end=false
LCYAN="\033[1;36m" # colors for echo
LPURPLE="\033[1;35m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LGREEN="\033[1;32m"
CYANBG="\033[46m"
BLACK="\033[0;30m"
NC="\033[0m" # no color

# functions
listTracks(){
  count=0
  echo -e "\n${PURPLE}files in ${LPURPLE}~/Music/vgmSet${NC}\n" # -e to allow color

  for filename in ${files[@]}
  do
    echo -e $CYAN$count$NC $LCYAN$filename$NC # clusterfuck but yea...
    ((count++))
  done
}

selectTrack(){
  echo -n -e "\n${PURPLE}pleez select your ${LPURPLE}track: ${LGREEN}" # -n to stop carriage return
  read -n 2
  echo -e "${BLACK}${CYANBG}"

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

vgmPlayer(){
  # program loop
  while :
  do
    listTracks
    selectTrack

    if [[ $end == true ]] # if end var is changed
    then
      echo -n -e "${NC}" # turn off font colors before shutdown
      break # end while loop / program
    else
      playTrack
    fi
  done
}

# call program
vgmPlayer
