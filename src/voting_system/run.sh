cairo-compile voting.cairo --output voting_compiled.json

cairo-run --program=voting_compiled.json \
    --print_output --layout=small \
    --program_input=voting_input.json
