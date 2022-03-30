#!/bin/sh

ulimit -n 4096
ulimit -c unlimited
ulimit -Sc unlimited

cmd="`pwd`/build/bin/openjabnab -c `pwd`/conf"
if [ $# -eq 0 ]; then
  while true; do
    catchsegv $cmd
    pid=$!
    echo "OJN crashed with exit code $?.  Respawning.." >&2
    sleep 1
    kill -9 $pid
  done
elif [ $1 == "--gdb" ]; then
  gdb -ex run --args $cmd
elif [ $1 == "--valgrind" ]; then
  valgrind $cmd
fi
