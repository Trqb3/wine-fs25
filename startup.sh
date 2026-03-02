#!/bin/bash
Xvfb :99 -screen 0 320x240x8 -nolisten tcp &
sleep 2
exec wine64 /home/container/.game/dedicatedServer.exe
