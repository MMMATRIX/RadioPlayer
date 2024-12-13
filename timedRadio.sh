#!/bin/bash
function startRadio()
{
	local procnum_="$1"
	if [[ $procnum_ == 0 ]]
		then
			ffplay https://audio.radio-banovina.hr:9998/stream &
		fi
}
function stopRadio()
{
	local procnum_="$1"
	if [[ $procnum_ != 0 ]]
		then
			pkill ffplay
		fi
}

while true
do
	current_time=$(date +%H:%M)
	procnum=$(pgrep -c ffplay)
		
	case $current_time in 
		"7:45")
			startRadio $procnum
			;;
		"8:00")
			stopRadio $procnum
			;;
		"8:45")
			startRadio $procnum
			;;
		"8:50")
			stopRadio $procnum
			;;
		"9:35")
			startRadio $procnum
			;;
		"9:40")
			stopRadio $procnum
			;;
		"10:25")
			startRadio $procnum
			;;
		"10:45")
			stopRadio $procnum
			;;
		"11:30")
			startRadio $procnum
			;;
		"11:35")
			stopRadio $procnum
			;;
		"12:20")
			startRadio $procnum
			;;
		"12:25")
			stopRadio $procnum
			;;
		"13:10")
			startRadio $procnum
			;;
		"13:15")
			stopRadio $procnum
			;;
		"test1")
			startRadio $procnum
			;;
		"test2")
			stopRadio $procnum
			;;
		*)
			echo "invalid"
			;;
	esac
	
		sleep 3
done
