#!/bin/sh
# file: nightmode.sh
# location: /jffs/scripts/
# device: RT-AC87U
#
# Purpose : schedule wifi radio in a kill switch proof way to replace the built-in feature 
# which disable scheduling as soon as the front panel button is pressed
#
# Date: 2017-05
# Version 1.0.1
#
#	1.0		First release
#	1.0.1	Code deaning, introduce the led_ctrl alignment instead of on/off via a cronjob. Leds will align on 
#
# Features
#	- Turn on / off wifi 2.4G and 5.0G
#	- Turn on / off leds
#
#


show_help()
{
    echo "Turns on / off wifi and leds on RT-AC87U"     
    echo "usage:"
    echo "nightmode.sh -on			wifi off, leds off"
    echo "nightmode.sh -off			wifi on, leds on"
    echo ""
}

option="${1}"
case ${option} in

        -on)
			#nightmode is on
			/jffs/scripts/radio_ctrl.sh -off
			cru a leds_align "*/2 * * * * /jffs/scripts/led_ctrl.sh -align"			
		;;
		-off)
			#nightmode is off
			/jffs/scripts/radio_ctrl.sh -on
			cru d leds_align
			/jffs/scripts/led_ctrl.sh -on
		;;
		*)
			show_help
			exit 1
		;;
esac
exit 0