#!/bin/sh

FILE="ex/ex1"

echo src/$FILE.cairo

cairo-compile src/$FILE.cairo --output json/$FILE_compiled.json
cairo-run --program=json/$FILE_compiled.json  --print_output --layout=small