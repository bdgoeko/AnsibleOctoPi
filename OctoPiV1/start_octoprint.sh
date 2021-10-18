#!/bin/bash

# script to start octoprint

export DATIME=`date +%Y%m%d%H%M%S`

# should really be adding a lock file.. arg.

# function to move old logs
function mv_log {

  if test -f "$1"; then
    TEMP=${1%%.log}
    NEW_LOG_FILE="${TEMP}_${DATIME}.log"
    echo "Moving old logfile $1 to ${NEW_LOG_FILE}"
    mv "$1" "${NEW_LOG_FILE}"
  fi  

}

# Setup log files.... 
#  ? make hard links to log file name with date of start of octoprint ? 

mv_log "octoprint_error.log"
mv_log "octoprint.log"

echo "Starting Octoprint"
exec OctoPrint/bin/octoprint 2> ~/octoprint_error.log > ~/octoprint.log &

