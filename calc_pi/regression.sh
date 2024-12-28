#!/bin/bash

set -ex
./calc_pi.out >tmp.regression.txt
diff regression.txt tmp.regression.txt

