#!/bin/bash

set -ex

./grep.out '\s*let\s+\w+\s*=' grep.fix >tmp.regression.txt
diff regression.txt tmp.regression.txt

