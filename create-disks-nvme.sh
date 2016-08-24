#!/bin/bash
i=0

function make_partition
{
    parted -s "$1" mklabel gpt
    #parted -s "$1" unit s mkpart primary "$2" "$3"
    parted -s "$1" unit s mkpart primary 2048s 100%
}

for z in `seq 0 23`; do
  i=$[i+1]
  #echo ${z} ${i}
  if [ ! -b /dev/nvme${z}n1 ]; then
    echo "Drive #${i} /dev/nvme${z}n1 not found"
    continue
  fi
  if [ ! -b /dev/nvme${z}n1p1 ]; then
    echo "Creating disk /dev/nvme${z}n1p1"
    make_partition /dev/nvme${z}n1 `parted -m /dev/nvme${z}n1 unit s print free | grep 'free;' | sort -t : -k 4n -k 2n | tail -n 1 | cut -d':' -f 2-3 --output-delimiter ' '`
    if [ ! -b /dev/nvme${z}n1p1 ]; then
      echo "Error creating partition on drive #${i} /dev/nvme${z}n1p1"
      exit
    fi
    mkfs.xfs /dev/nvme${z}n1p1
  fi
  if [ ! -d /srv/disk${i} ]; then
     mkdir /srv/disk${i}
  fi
  echo "Drive #${i} /dev/nvme${z}n1p1 mounting"
  mount /dev/nvme${z}n1p1 /srv/disk${i}
  if [ `stat -c "%a" /srv/disk${i}` != "777" ]; then
    echo "Setting drive #${i} /dev/nvme${z}n1p1 to chmod 777 permissions"
    chmod 777 /srv/disk${i}
  fi
done
