#!/bin/bash

#variable 
keyword1="MACFLAP_NOTIF"
keyword2="link-flap error"
keyword3="ERR_DISABLE"
#keyword1="THRESHOLD_VIOLATION"
keyword4="CPUFALLINGTHRESHOLD"

#function using for variable
func_key() {
	#now=$(date --date="5 minute ago") if you wanna to uddate every 5 minute
	#now=$(date) #update every second
	#month=$(echo "$now" | cut -d' ' -f2-3)
	#mykey=($now)
	#IFS=":"
	#read -ra minute <<< "${mykey[3]}"
	#min1=$"${minute[0]}"
	#min2=$"${minute[1]}"
	#min3=$"${minute[2]}"
	#newminute=${min2::1}
	#finalminute=${newminute[0]}
	#key1="$month $min1:$min2:$finalminute"
	#echo "$key1"
	now=$(date | cut -c 5-18) #other solutions
	echo "$now"
}

#function counting if there is happen any anomaly as definition in above
func_check() {
	
	time="$(func_key)"
	keywoards=$(cat /home/keyword)
	keys=$keywoards
	myvar="$(tail -2 /var/log/$1.log | grep -i "$time" | grep -i -F "${keys}" -c)"
	echo "$myvar"
}

#function using for custom message want to send in telegram or other
func_message() {
	
	time="$(func_key)"
	keywoards=$(cat /home/keyword)
	keys=$keywoards
	myvari="$(tail -2 /var/log/$1.log | grep -i "$time" | grep -i -E "$keys")"
	echo "$myvari"
}

func_find_root_cause() {

	find="$(func_message $1)"
	myarray=($find)

	case "$find" in
	*"$keyword1"*)
		message=$"${myarray[8]} ${myarray[3]} ${myarray[10]} ${myarray[14]} ${myarray[15]} ${myarray[19]} ${myarray[20]} ${myarray[21]} ${myarray[23]} "
		echo "$message";;
	*"$keyword2"*)
		message=$"${myarray[8]} ${myarray[3]} ${myarray[10]} ${myarray[15]} ${myarray[16]} ${myarray[17]} ${myarray[18]} ${myarray[19]} ${myarray[20]} "
		echo "$message";;
	*"$keyword3"*)
		message=$"${myarray[8]} ${myarray[3]} ${myarray[10]} ${myarray[11]} ${myarray[13]} ${myarray[15]} ${myarray[16]} ${myarray[17]} ${myarray[19]} "
		echo "$message";;
	*"$keyword4"*)
		message=$"${myarray[8]} ${myarray[3]} ${myarray[10]} ${myarray[12]} ${myarray[13]} ${myarray[14]} ${myarray[15]} "
		echo "$message";;
	*)
		echo "$find";;
	esac
}

#function send message in telegram
func_send_message() {

	 chat_id="xxxxxxxx" #your chatid
	 url="https://api.telegram.org/xxxxxxxxxx/sendMessage" #xxxxxxxx your bot id
	 message="$(func_find_root_cause $1)"
	 curl -s -X POST "$url" -d chat_id="$chat_id" -d text="$message"
}

key1="$(func_key)"

while IFS= read -r list; do #loop for cheching devices list

	chek1="$(func_check $list)" #comparation process

	if [ $chek1 -gt 0 ] #condition statement 
	then

		func_send_message $list #true condition

	else

		echo "$list ok" #false condition

	fi
done </home/list_devices #end loops
