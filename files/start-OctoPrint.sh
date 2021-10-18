#!/bin/bash

# A simple script to start OctoPrint

EXIT_STATUS=0

#DAEMON="~${USER}/OctoPrint/bin/octoprint"
#DAEMON="/home/pi/OctoPrint/bin/octoprint"

DATIM=`date +%Y%m%d%H%M`

#LOG_FILE=~${USER}/OctoPrint/log/log-${DATIM}.log
LOG_FILE=/home/pi/OctoPrint/log/log-${DATIM}.log
echo "OctoPrint start by ${USER} dat ${DATIM}" >> ${LOGFILE}

#If you do not supply a custom pidfile location via --pid PIDFILE, it will be created at /tmp/octoprint.pid.
# check for PID file and see if that pid exists and is octoprint

# What to check if there is already octoprint running ?
#RUNN_OCTOPRINT=`ps -eaf | grep -i ${DAEMON}`

# will be running out of user home directory because that is how the python env has set up octoprint
if test "${USER}" != "pi" ; then
  echo "Incorrect user '${USER}'" | tee -a ${LOG_FILE}
  exit 131
fi

# Activate the venv
source /home/pi/OctoPrint/bin/activate

#/usr/bin/python /home/pi/OctoPrint/bin/octoprint > /home/pi/OctoPrint/log/octoprint.log 2>&1 (code=exited, status=1/FAILURE)
/home/pi/OctoPrint/bin/octoprint serve  > "${LOG_FILE}" 2>&1

echo "OctoPrint Exited" >> "${LOG_FILE}"
date >> "${LOGFILE}"
exit ${EXIT_STATUS}

