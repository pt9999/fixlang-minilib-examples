#!/bin/bash

set -ex
./sudoku.out generate -s 123 >tmp.regression.txt
diff regression.txt tmp.regression.txt

