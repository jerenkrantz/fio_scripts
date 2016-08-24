#!/bin/bash

if [ -f /etc/redhat-release ]; then
  # this requires EPEL, rhel-7-server-optional-rpms, rhel-7-server-extras-rpms
  yum install bc fio xfsprogs sysstat
else
  apt-get install bc fio xfsprogs sysstat
fi
