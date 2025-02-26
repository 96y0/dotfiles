#!/bin/bash

spotify='playerctl --player=spotify metadata -f'

def_title='No Song Playing'
def_artist='Spotify'
def_image="$HOME/.config/eww/images/spotify.jpg"

last_img=''
img_path='/tmp/album_art.jpg'

get_title() {
  title=$($spotify '{{title}}')

  if [[ $? != 0 ]]; then
    title=$def_title
  fi

  echo $title
}

get_artist() {
  artist=$($spotify '{{artist}}')

  if [[ $? != 0 ]]; then
    artist=$def_artist
  fi

  echo $artist
}

get_status() {
  status=$($spotify '{{status}}')

  if [[ $? != 0 ]]; then
    status="Paused"
  fi

  echo $status
}

get_image() {
  img=$($spotify '{{mpris:artUrl}}')
 
  if [[ $? != 0 ]]; then
    img=$def_image
  elif [[ "$last_img" != "$img" ]]; then
    wget -q -O "$img_path" "$img"

    if [[ $? == 0 ]]; then
      last_img=$img
      img=$img_path
    else
      img=$def_image
    fi
  fi

  echo $img
}

if [[ $1 == "--get-title" ]]; then
  get_title
elif [[ $1 == "--get-artist" ]]; then
  get_artist
elif [[ $1 == "--get-status" ]]; then
  get_status
elif [[ $1 == "--get-image" ]]; then
  get_image
fi
