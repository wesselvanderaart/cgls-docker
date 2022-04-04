#!/bin/bash
set -m # enable job control 

# start service normally
/usr/ChaosGroup/VRLService/OLS/vrls &
sleep 5 # give service time to start

ONLINE_STATUS=$(/usr/ChaosGroup/VRLService/OLS/vrlctl online status)
echo "$ONLINE_STATUS"

if [ "$ONLINE_STATUS" != "[  OK  ] Online licensing is available." ]; then
    echo "Server hasn't been registred yet.."
    /usr/ChaosGroup/VRLService/OLS/vrlctl online login --credentials $1
fi

fg %- # get vrls service back to foreground so the container keeps running




