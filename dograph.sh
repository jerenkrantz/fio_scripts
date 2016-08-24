#!/bin/bash

DIRNAME=`dirname $0`

if [ $# -lt 2 ]; then
  echo "Give me more!"
  echo "$0 [.r files dir] [output dir]"
  exit
fi

if [ ! -d $2 ]; then
  mkdir $2
fi

pushd $DIRNAME

for i in $1/*.r; do
  echo "Processing `basename $i .r`"
  R -e "dir <- '$2/';hist_dir <- '$2/hist_';source('$i');source('fiop.r');source('fiopg.r');" >/dev/null
done

cat > $2/HEADER.html <<EOF
<head>$1 fio run (results generated `date`)</head>
<h4>Reads: 1,8,16,32,64 users <i>per disk</i></h4>
<ul>
<li><a href="randread_bs_8K.html">Random Read (blocksize 8K)</a></li>
<li><a href="randrw_bs_8K.html">Random Read/Write (blocksize 8K; 80% read/20% write)</a></li>
<li>Sequential Read: <!--a href="read_bs_128K.html">128K</a-->
                     <a href="read_bs_1M.html">1M</a>
                     <a href="read_bs_4M.html">4M</a> blocksize</li>
<li>Sequential Read: <a href="read_users_1.html">1</a>
                     <a href="read_users_8.html">8</a>
                     <a href="read_users_16.html">16</a>
                     <a href="read_users_32.html">32</a>
                     <a href="read_users_64.html">64</a> users</li>
</ul>
<h4>Writes: 1,4,16 users <i>per disk</i></h4>
<ul>
<li>Write: <a href="write_bs_8K.html">8K</a>
           <a href="write_bs_1M.html">1M</a> blocksize</li>
<li>Write: <a href="write_users_1.html">1</a>
           <a href="write_users_4.html">4</a>
           <a href="write_users_16.html">16</a> users</li>
</ul>
EOF

for a in randread_bs_8K randrw_bs_8K read_users_1 read_users_8 read_users_16 read_users_32 read_users_64 write_users_1 write_users_4 write_users_16 read_bs_1M read_bs_4M write_bs_8K write_bs_1M; do
  echo "Generating index file for $a" 
  echo "<html><body>" > $2/$a.html
  for i in $2/hist_*_$a.png; do
    echo "<img src='`basename $i`' />" >> $2/$a.html
  done
  echo "</body></html>" >> $2/$a.html
done

popd
