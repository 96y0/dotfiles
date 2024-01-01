#!/bin/bash

cp .tmux.conf $HOME/

mkdir -p $HOME/.fonts
cp -r .fonts/* $HOME/

mkdir -p $HOME/.config
cp -r .config/* $HOME/.config/

