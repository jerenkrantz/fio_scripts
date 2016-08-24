#!/bin/bash
i=0

function make_partition
{
    parted -s "$1" mklabel gpt
    #parted -s "$1" unit s mkpart primary "$2" "$3"
    parted -s "$1" unit s mkpart primary 2048s 100%
}

for z in a b c d e f g h i j k l m n o p; do
  i=$[i+1]
  #echo ${z} ${i}
  if [ ! -b /dev/sd${z} ]; then
    echo "Drive #${i} /dev/sd${z} not found"
    continue
  fi
  if [ ! -b /dev/sd${z}1 ]; then
    echo "Creating disk /dev/sd${z}1"
    make_partition /dev/sd${z} `parted -m /dev/sd${z} unit s print free | grep 'free;' | sort -t : -k 4n -k 2n | tail -n 1 | cut -d':' -f 2-3 --output-delimiter ' '`
    if [ ! -b /dev/sd${z}1 ]; then
      echo "Error creating partition on drive #${i} /dev/sd${z}"
      exit
    fi
    mkfs.xfs /dev/sd${z}1
  fi
  if [ ! -d /srv/disk${i} ]; then
     mkdir /srv/disk${i}
  fi
  echo "Drive #${i} /dev/sd${z}1 mounting"
  mount /dev/sd${z}1 /srv/disk${i}
  if [ `stat -c "%a" /srv/disk${i}` != "777" ]; then
    echo "Setting drive #${i} /dev/sd${z}1 to chmod 777 permissions"
    chmod 777 /srv/disk${i}
  fi
done
