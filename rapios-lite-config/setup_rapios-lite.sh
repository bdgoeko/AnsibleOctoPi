#!/bin/bash

EXIT_STATUS=0
# this script will setup env for

#if test $# -lt 

RASP_ROOT=/media/goeko/rootfs
FLASH_DRIVE=/dev/sdh

# make sure we got passed a


# Make sure we are root
if test ${EUID} -ne 0 ; then
  echo "Not running as root, unable to make changes."
  echo "no point then! dieing..."
  # Exit now with error
  exit 2
fi

if test -d "${RASP_ROOT}" ; then
  echo "Setting up rapios-lite OS"

  cd ${RASP_ROOT}

  # okay this isn't good, but for now... just add to the end of the file
  if test -f "etc/dhcpcd.conf"; then
    cp etc/dhcpcd.conf etc/dhcpcd.conf.orig
    echo "interface eth0
static ip_address=10.1.1.91
static routers=10.1.1.1
static domain_name_servers=10.1.1.18" >> etc/dhcpcd.conf
  else
    echo "No etc/dhcpcd.conf ? "
    exit 123
  fi

  mkdir -p home/pi/.ssh
#  if test -f cp ${HOME}/.ssh/id_rsa.pub ; then
#  if test -f      "~goeko/.ssh/id_rsa.pub" ; then
  if test -f  "/home/goeko/.ssh/id_rsa.pub" ; then 
    cp ~goeko/.ssh/id_rsa.pub home/pi/.ssh/authorized_keys
  else
    echo "User has no ssh public key"
    exit 122
  fi

  echo "Have to Setup ssh access"

  # all good
  echo "All good, umounting ${FLASH_DIRVE}"
  sync;sync;sync

  DRIVE=`basename ${FLASH_DRIVE}`
  # find host for drive
  HOST=`readlink /sys/block/${DRIVE} | cut -d/ -f9`

  #Disconnect Device
  echo 1 > "/sys/block/${DRIVE}/device/delete"

  #umount ${FLASH_DRIVE}

  # to reset host, bring drive back.. (with automount)
  # echo "- - -" > "/sys/class/scsi_host/${HOST}/scan"

  echo "Drive disconnected"

else
  echo "rootfs '${RASP_ROOT}' not found."

fi

exit ${EXIT_STATUS}
