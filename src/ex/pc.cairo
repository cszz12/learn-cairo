
# https://www.cairo-lang.org/docs/how_cairo_works/functions.html
# cairo-compile pc.cairo --output pc_compiled.json
# cairo-run --program=pc_compiled.json --no_end --step=16 --print_output --layout=small 

# cairo-run --program=pc_compiled.json --print_output --print_info --relocate_prints --no_end --step=16 

# %builtins output 

from starkware.cairo.common.serialize import serialize_word

func main():
    # call foo
    # call foo
    # call foo
    # [ap+3] = 1001; ap++
    foo(12,35)

    [ap] = 2007
    ret
end

func foo(x,y)-> (z, w):
    [ap] = x+y; ap++
    [ap] = x*y; ap++
    ret
end

# cairo-run --program=pc_compiled.json  --print_output --layout=small --print_memory --relocate_prints

# 17    26  //old_fp
# 18    26  //return_pc
# 19    12 // in0
# 20    35 // in1
# 21    19 //[fp - 2]
# 22    11 //Restores fp
# 23    47 //return value0
# 24    420 //return value1
# 25    2007 //assign next one [ap] = 2007