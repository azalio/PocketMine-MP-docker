#!/bin/bash

if [ ! -f 'pocketmine.yml' ]; then
    cp pocketmine.yml.example pocketmine.yml
fi

if [ ! -f 'server.properties' ]; then
    cp server.properties.example server.properties
fi

if [ -z "$RCON_PASSWORD"]; then
    echo enable-rcon=off >> ./server.properties
else
    echo rcon.password=$RCON_PASSWORD >> ./server.properties
    echo enable-rcon=on >> ./server.properties
fi

./start.sh
