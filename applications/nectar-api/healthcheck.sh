#!/bin/bash

ip=$1
public_ip=$2
port=3001
hostname=${ip}:${port}

echo "healthcheck script got public address $public_ip"

for (( ; ; ))
do
    sleep 1
    if [[ $(wget -S -T1 -t1 http://${hostname}/api/health-check 2>&1 | grep "HTTP/1" | awk '{print $2}') == "200" ]] ; then
        echo 'connected to' ${hostname}
        exit 0
    else
        echo 'cannot connect to' ${hostname}
    fi
done
exit 1
