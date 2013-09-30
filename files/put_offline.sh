#!/bin/sh
echo " `date` : Putting $1 to offline as disk is full : $2 ">>/var/log/eventhandler.log

/usr/bin/pbsnodes -o $1 -N "Offline by Nagios as Disk is full"
echo "$?"

