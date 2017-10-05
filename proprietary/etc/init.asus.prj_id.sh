#!/system/bin/sh

prj_id=`cat /proc/apid`
setprop ro.pro.apid $prj_id

apsta=`cat /proc/apsta`
setprop ro.pro.apsta $apsta

apcpu=`cat /proc/apcpu`
setprop ro.pro.apcpu $apcpu

#add for AsusSettings - About - Hardware Information - CPU
#cpufreq=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
if [ "$apcpu" = "0" ] || [ "$apcpu" = "1" ]; then
	#8937/8917 cpu max freq: 1.4GHz
	setprop ro.cpufreq "1.4GHz"
else
	echo "cpufreq unknown"
fi

#add for AsusSettings - About - Hardware Information - RAM
if [ "$prj_id" = "8" ] || [ "$prj_id" = "9" ]; then
	#Capricorn Memory: 3G
	setprop ro.memsize "3G"
else
	#Gemini&Scorpio
	apmem=`cat /proc/apmem`
	apddr=$((${apmem}&7))
	if [ "$apddr" = "2" ] || [ "$apddr" = "3" ] || [ "$apddr" = "4" ]; then
		setprop ro.memsize "4G"
	else
		setprop ro.memsize "2G"
	fi
fi
