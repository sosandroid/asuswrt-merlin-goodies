#!/bin/sh
# file: led_ctrl.sh
# location: /jffs/scripts/
# device: RT-AC87U
#
# Purpose : Turn on/off the led panel of the router
#
# Date: 2017-05
# Version 1.0
#
#
#

status_led=`nvram get led_disable`
status_wifi=`qcsapi_sockrpc rfstatus wifi0`
action="${1}"

show_help()
{
    echo "Turns on / off leds on RT-AC87U"     
    echo "usage:"
    echo "led_ctrl.sh -on		leds on"
    echo "led_ctrl.sh -off		leds off"
	echo "led_ctrl.sh -status	returns leds status"
	echo "led_ctrl.sh -align	Align led status to the wifi status to match overided turn on/off - called at nigth through cronjob"
	echo "Any other option displays this help"
    echo ""
}

case ${action} in

        -on)
			if [ $status_led = "1" ]
			then
				nvram set led_disable=0 &>/dev/null
				service restart_leds &>/dev/null
				logger "$0: Leds are on"
			else
				logger "$0: Leds are already in requested status - nothing done"
			fi
		;;
		-off)
			if [ $status_led = "0" ]	
			then
				nvram set led_disable=1 &>/dev/null
				service restart_leds &>/dev/null
				logger "$0: Leds are off"
			else
				logger "$0: Leds are already in requested status - nothing done"
			fi
		;;
		-status)
			if [ $status_led = "0" ]
			then
				echo "Leds status is on"
			elif [ $status_led = "1" ]
			then
				echo "Leds status is off"
			else
				echo "Leds status is unknown"
			fi
		;;
		-align)
			if [ $status_led = "0" ] && [ $status_wifi = "Off" ]
			then
				nohup $0 -off &>/dev/null
			elif [ $status_led = "1" ] && [ $status_wifi = "On" ]
			then
				nohup $0 -on &>/dev/null
			else
				:
			fi
		;;
		*)
			show_help
			exit 1
		;;
esac
exit 0
