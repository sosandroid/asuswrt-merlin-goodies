Asuswrt-Merlin custom scripts - Nightmode
==============

	v1.0 - First release
	v1.0.1 - Reworked the cronjob for leds, remove useless code, add install script

Disables wifi and leds at night according to a cronjob schedule. This does not use the built-in implementation to allow overide of the schedule using the front panel button.
Those scripts are used on top of [Asuswrt-Merlin](https://github.com/RMerl/asuswrt-merlin) firmware custom [scripts feature](https://github.com/RMerl/asuswrt-merlin/wiki/User-scripts)


## Devices ##
All those scripts are done for RT-AC87U and need adaptation for other devices

## Basic usage ##
As soon as you trigger the nightmode, the radio goes off and the leds follows within 2 minutes. Every 2 minutes, the led status is checked to align it to any toggled radio status. As soon as the nightmode goes off, the leds are on and remain to this status.

## Installation ##

### 1st alternative : a bit automated ###
You don't have any script installed and `services-start` is empty or does not exist. Moreover, you're ok with the current scheduling

```
cd /jffs/scripts
wget https://github.com/sosandroid/asuswrt-merlin-goodies/raw/master/nightmode/install.sh
chmod a+rx /jffs/scripts/install.sh
./install.sh
```

### 2nd alternative : by hand ###

Download this repo and modify the wanted scheduling. Append it to any existing `services-start` on the router itself. Push the `nightmode.sh`, `led_ctrl.sh`, `radio_ctrl.sh` to `/jffs/scripts` and reboot your router

Reconnect and check the crontab `cru -l`

## Usage ##
Displays help calling scripts without argument
```
/jffs/scripts/nightmode.sh
/jffs/scripts/led_ctrl.sh
/jffs/scripts/radio_ctrl.sh
```