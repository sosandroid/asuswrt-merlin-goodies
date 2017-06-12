#!/bin/sh
# file: install.sh
# location: /jffs/scripts/
# device: RT-AC87U
#
# Purpose : Install scripts that overrides the built-in scheduling 
#
# Date: 2017-06
# Version 1.0
#
#	1.0		First release
#
#

cd /jffs/scripts
wget https://github.com/sosandroid/asuswrt-merlin-goodies/raw/master/nightmode/led_ctrl.sh
wget https://github.com/sosandroid/asuswrt-merlin-goodies/raw/master/nightmode/radio_ctrl.sh
wget https://github.com/sosandroid/asuswrt-merlin-goodies/raw/master/nightmode/nightmode.sh
wget https://github.com/sosandroid/asuswrt-merlin-goodies/raw/master/nightmode/services-start

chmod a+rw /jffs/scripts/*
./services-start

echo "You're done, installation is ready. Check the cronjob table to make sure"
exit 0