#!/bin/bash

#enable job control in script
set -e -m

#####   variables  #####
: ${PASS:=jenkins}

# add command if needed
if [ "${1:0:1}" = '-' ]; then
  set -- sshd "$@"
fi

#run command in background
if [ "$1" = 'sshd' ]; then
  ##### pre scripts  #####
  echo "========================================================================"
  echo "initialize:"
  echo "========================================================================"
  echo "root:$PASS" | chpasswd
  if [ "${AUTHORIZED_KEYS}" != "**None**" ]; then
    mkdir -p /root/.ssh && chmod 700 /root/.ssh
    touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
    IFS=$'\n'
    arr=$(echo ${AUTHORIZED_KEYS} | tr "," "\n")
    for x in $arr
    do
      x=$(echo $x |sed -e 's/^ *//' -e 's/ *$//')
      cat /root/.ssh/authorized_keys | grep "$x" >/dev/null 2>&1
      if [ $? -ne 0 ]; then
        echo "=> Adding public key to /root/.ssh/authorized_keys: $x"
        echo "$x" >> /root/.ssh/authorized_keys
      fi
    done
  fi
  
  ##### run scripts  #####
  echo "========================================================================"
  echo "startup:"
  echo "========================================================================"
  exec "$@" &

  ##### post scripts #####
  echo "========================================================================"
  echo "configure:"
  echo "========================================================================"
  
  #bring command to foreground
  fg
else
  exec "$@"
fi
