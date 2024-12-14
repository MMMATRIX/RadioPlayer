#!/bin/bash
url="$1"
starttime="$2"
endtime="$3"
function startRadio()
{
	local procnum_="$1"
	if [[ $procnum_ == 0 ]]
		then
			ffplay $url &
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
		07:[4-5][0-9])
			startRadio $procnum
		;;
		
		08:4[5-9])
			startRadio $procnum
		;;

		09:3[5-9])
			startRadio $procnum
		;;
		
		10:2[5-9])
			startRadio $procnum
		;;
		10:3[0-9])
			startRadio $procnum
		;;
		10:4[0-4])
			startRadio $procnum
		;;
		
		11:3[0-4])
			startRadio $procnum
		;;
		
		12:2[0-4])
			startRadio $procnum
		;;
		
		13:1[0-4])
			startRadio $procnum
		;;
		
		*)
			stopRadio $procnum
			;;
	esac
		sleep 3
done
