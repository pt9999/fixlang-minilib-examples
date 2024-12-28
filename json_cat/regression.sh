#!/bin/bash

set -ex

# `regression-input.json` is created by running the following command in the fixlang source directory:
# ```
# cargo build --message-format=json | grep '"package_id":"fixlang.*"'
# ```
./json_cat.out -i regression-input.json -o tmp.regression-output.json
diff regression-output.json tmp.regression-output.json

