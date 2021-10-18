#!/bin/bash

#

RASP_IMAGE=2021-05-07-raspios-buster-armhf-lite.img
FLASH_DRIVE=/dev/sdh

# Make sure we are root
if test ${EUID} -ne 0 ; then
  echo "Not running as root, unable to make changes."
  echo "no point then! dieing..."
  # Exit now with error
  exit 2
fi



dd if=2021-05-07-raspios-buster-armhf-lite.img of=/dev/sdh

sync;sync;sync


exit ${EXIT_STATUS}
