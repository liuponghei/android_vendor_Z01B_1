#!/system/bin/sh
	gesture_type=`getprop persist.asus.gesture.type`
	now_type=`cat /sys/bus/i2c/devices/3-005d/gesture_mode`
	if [ "$((2#$gesture_type))" != "$((16#$now_type))" ];then
		echo "$gesture_type" > /sys/devices/soc/78b7000.i2c/i2c-3/3-005d/gesture_mode
	else
		echo "gesture_type had set last time"
	fi

