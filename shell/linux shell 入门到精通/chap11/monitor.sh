#!/bin/bash
#******************************************************************************
# filename	: monitor.sh
# function	: 监控系统状态
#******************************************************************************

# maximum ratio of memory usage
mem_quota=80

# fetch the ratio of memory usage
# @return 1 : if large than $mem_quota
#		  0 : if less than $mem_quota
watch_memory(){
	mem_total=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
	mem_free=`cat /proc/meminfo | grep MemFree | awk '{print $2}'`
	mem_usage=$((100-100*mem_free/mem_total))
	if [ $mem_usage -gt $mem_quota ];
	then
		mem_message="ALARM!!! The memory usage is $mem_usage%!!!"
		return 1
	else
		return 0
	fi
}

# 硬盘监控
# maximum ratio of hard disk usage
hd_quota=80

# fetch the ratio of hard disk usage
# @return 1 : if larger than $hd_quota
#		  0 : if less than $hd_quota
watch_hd() {
	hd_usage=`df | grep /dev/sda1 | awk '{print $5}' | sed 's/%//g'`
	if [ $hd_usage -gt $hd_quota ]; # ******************* maybe error
	then
		mem_message="ALARM!!! The hard disk usage is $hd_usage%!!!"
		return 1
	else
		return 0
	fi
}

# 计算CPU使用率
# Maximum ratio of cpu usage
cpu_quota=80
# Time gap between two times fetching cpu status
time_gap=60

# This is a function to fetch cpu status at a time point
# Format used unused
get _cpu_info() {
	cat /proc/stat | grep -i "^cpu[0-9]\+" | \
		awk '{used+=$2+$3+$4; unused+=$5+$6+$7+$8} \
		END{print used, unused}'
}

# This is the main function fo watching cpu
# Fetch cpu stat two times, with time gap, then calculate the average status
watch_cpu() {
	time_point_1=`get_cpu_info`
	sleep $time_gap
	time_point_2=`get_cpu_info`
	cpu_usage=`echo $time_point_1 $time_point_2 | \
		awk '{used=$3-$1;total+=$3+$4-$1-$2; \ 
		print used*100/total}'`
	if [ $cpu_usage > $cpu_quota ];
	then
		cpu_message="ALARM!!! The cpu usage is over $cpu_usage!!!"
		echo $cpu_usage
		return 1
	else
		echo $cpu_usage
		return 0
	fi
}

# 最忙的进程
# This function fetches the top 10 busiest processes
proc_cpu_top10() {
	proc_busiest=`ps aux | sort -nk 3r | head -11`
}

# 系统监控
# Generate report every 10 minutes
runtime_gap=600

while true;
do
	report=""
	if [ `watch_memory` -eq 1 ];
	then
		report=$report'\n'$mem_message
	fi

	if [ `watch_hd` -eq 1 ];
	then
		report=$report'\n'$hd_message
	fi

	if [ `watch_cpu` -eq 1 ];
	then
		report=$report'\n'$cpu_message
		proc_cpu_top10
		report=$report'\n'$proc_busiest
	fi

	if [ -n $report ];
	then
		sendmessage phonenumber report # 发送短信
	fi
	sleep $((runtime_gap-time_gap))
done
