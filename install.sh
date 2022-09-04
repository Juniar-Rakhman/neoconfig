#!/usr/bin/sh

NVIM_ROOT=~/.config/nv
export NVIM_ROOT

rm -rf $NVIM_ROOT

mkdir -p $NVIM_ROOT/share
mkdir -p $NVIM_ROOT/nvim

stow --restow --target=$NVIM_ROOT/nvim .

alias nv='XDG_DATA_HOME=$NVIM_ROOT/share XDG_CONFIG_HOME=$NVIM_ROOT nvim' 

export nv
