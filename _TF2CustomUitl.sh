#!/bin/bash
#W.I.P is not finished cuz I don`t use linux

inifile='Comfig.ini' 

# declare $config to be an associative array
declare -A config

while IFS='=' read -r key val ; do 
    config["$key"]="$val"
done <  <(sed -E -e '/^\[/d
                     s/#.*//
                     s/[[:blank:]]+$|^[[:blank:]]+//g' "$inifile" )

# now print out the config array
set | grep '^config='