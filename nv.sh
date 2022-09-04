#!/usr/bin/sh

NVIM_ROOT=~/.config/nv
export NVIM_ROOT

alias nv='XDG_DATA_HOME=$NVIM_ROOT/share XDG_CONFIG_HOME=$NVIM_ROOT nvim' 
export nv

nv
