#!/bin/bash

set -ex
./probable_primes.out -f 256 -t 256 --seed 123 | grep -v '^time' >tmp.regression.txt
diff regression.txt tmp.regression.txt

