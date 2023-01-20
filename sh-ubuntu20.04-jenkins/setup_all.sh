#!/bin/bash

date >> setup.err.log
for f in *_setup.sh; do
  #fix line endings windows - unix
  sed -i 's/\r$//' $f || true & 
  wait
  echo "$f" >> setup.err.log || true & 
  wait
  /bin/bash $f  2>> setup.err.log || true & 
  wait
done