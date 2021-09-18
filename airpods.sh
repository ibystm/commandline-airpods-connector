#!/bin/bash

# refs
# https://github.com/deweller/switchaudio-osx
# https://github.com/lapfelix/BluetoothConnector

AIR_PODS_MAC_ADDRESS="Your airpods Mac Adress"
AIR_PODS_NAME="Yor airpods name"

/usr/local/bin/bluetoothconnector -c $AIR_PODS_MAC_ADDRESS

for ((i=0 ; i<10 ; i++))

do
    if [ "Connected" == $(/usr/local/bin/bluetoothconnector -s $AIR_PODS_MAC_ADDRESS) ]; then
        sleep 1
        /usr/local/Cellar/switchaudio-osx/1.1.0/SwitchAudioSource -s $AIR_PODS_NAME
        sleep 1
        /usr/bin/osascript -e 'display notification "Airpods connected to this mac" with title "Connected!!"'
        sleep 1
        say -v samantha Connected!
        break
    fi
    sleep 1
done