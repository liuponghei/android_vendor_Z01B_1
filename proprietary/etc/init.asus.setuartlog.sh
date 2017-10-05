#!/system/bin/sh
audbg_mode=`getprop persist.asus.audbg`
if [ ".$audbg_mode" == ".0" ];then
		setprop sys.config.uartlog 0
		echo ndbg > /proc/asusdebug
elif [ ".$audbg_mode" == ".1" ];then
		setprop sys.config.uartlog 1
		echo dbg > /proc/asusdebug
else
	echo "error persist.asus.audbg"
fi
