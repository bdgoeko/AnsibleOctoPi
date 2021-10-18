#!/bin/bash

BIN_PATH=/usr/local
LOG_FILE=/var/log/mjpg_streamer.log

# need to read
#https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/

# should swap logs....
# should have a PPID mgmt...
# should use lock file make sure only one running...

echo "mjpg_streamer start" >> "${LOG_FILE}"
date >> /var/log/mjpg_streamer.log

export LD_LIBRARY_PATH=${BIN_PATH}/lib/mjpg_streamer/

echo 'Starting streamer ${BIN_PATH}/bin/mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so -x 1280 -y 720 -fps 15 -vf"' >> "${LOG_FILE}"

exec ${BIN_PATH}/bin/mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so -x 1280 -y 720 -fps 15 -vf" >> "${LOG_FILE}"    
