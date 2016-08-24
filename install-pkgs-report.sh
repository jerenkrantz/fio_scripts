#!/bin/bash

if [ -f /etc/redhat-release ]; then
  # this requires EPEL
  yum install R-core
else
  apt-get install r-base
fi
