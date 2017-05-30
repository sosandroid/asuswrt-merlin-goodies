Asuswrt-Merlin custom scripts - Nightmode
==============

	v1.0 - First release

Disables wifi and leds at night according to a cronjob schedule. This does not use the built-in implementation to allow overide of the schedule using the front panel button.
Those scripts are used on top of [Asuswrt-Merlin](https://github.com/RMerl/asuswrt-merlin) firmware custom [scripts feature](https://github.com/RMerl/asuswrt-merlin/wiki/User-scripts)


## Devices ##
All those scripts are done for RT-AC87U and need adaptation for other devices

## Installation ##
- Copy `.sh` files to `/jffs/scripts/`
- Adapt the schedule available in 'services-start' file of this repo
- Append the desired schedule to `/jffs/scripts/services-start`
- Set proper flag to those files `chmod a+rx /jffs/scripts/*`

Reboot your rooter and check the crontab `cru -l`

## Usage ##
Displays help calling scripts without argument
```
/jffs/scripts/nightmode.sh
/jffs/scripts/leds_ctrl.sh
/jffs/scripts/radio_ctrl.sh
```