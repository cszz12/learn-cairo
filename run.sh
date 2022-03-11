#!/bin/sh

FILE="puzzle1"

echo src/$FILE.cairo

cairo-compile src/$FILE.cairo --output json/$FILE_compiled.json
cairo-run --program=json/$FILE_compiled.json  --print_output --layout=small