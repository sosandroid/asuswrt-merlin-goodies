#!/bin/sh
# file: radio_ctrl.sh
# location: /jffs/scripts/
# device: RT-AC87U
#
# Purpose : Turn on/off the wifi interfaces on 2.4 & 5.0 networks
#
# Date: 2017-05
# Version 1.0
#
#
#

status=`qcsapi_sockrpc rfstatus wifi0`
action="${1}"

show_help()
{
    echo "Turns on / off wifi on RT-AC87U"     
    echo "usage:"
    echo "radio_ctrl.sh -on		wifi on on both interfaces"
    echo "radio_ctrl.sh -off	wifi off on both interfaces"
	echo "radio_ctrl.sh -status	returns status of the 5G interface"
	echo "Any other option displays this help"
    echo ""
}

case ${action} in

        -on)
			if [ $status = "Off" ]
			then
				qcsapi_sockrpc rfenable 1 wifi0 &>/dev/null
				wl -i eth1 radio on &>/dev/null
				logger "$0: Wifi is on"
			else
				logger "$0: Wifi is already in requested status - nothing done"
			fi
		;;
		-off)
			if [ $status = "On" ]
			then
				qcsapi_sockrpc rfenable 0 wifi0 &>/dev/null
				wl -i eth1 radio off &>/dev/null
				logger "$0: Wifi is off"
			else
				logger "$0: Wifi is already in requested status - nothing done"
			fi
		;;
		-status)
			echo "wifi status is $status"		
		;;
		*)
			show_help
			exit 1
		;;
esac
exit 0
