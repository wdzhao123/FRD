#!/bin/bash

for ((i=1;i<=5;i++));
do 
  ./densecrf/build/examples/dense_inference ./test/test_LOS/$i.ppm ./test/test_crf/$i.ppm ./test/test_crf/b$i.ppm
  echo $i 'finish'
done
