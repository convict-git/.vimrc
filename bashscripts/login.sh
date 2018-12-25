#!/bin/bash
while :
do
	curl 'http://10.64.1.1:8090/login.xml' -H 'Origin: http://10.64.1.1:8090' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: */*' -H 'Referer: http://10.64.1.1:8090/httpclient.html' -H 'Connection: keep-alive' --data 'mode=191&username=111701022&password=********&a=1535471410240&producttype=0' --compressed > temp_log && now=$(date +"%T") && echo "Login time : $now"  >> temp_log
	./parse.out > log
	cat log
	sleep 150
done



