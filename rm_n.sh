#!/bin/bash                                                                                                                                                          

#inspect if there are 2 parameters                                                                                                                                   
if [[ $# -ne 2 ]]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

DIR=$1
SIZE=$2

#delete files with bytes greater than n                                                                                                                              
find "$DIR" -type f -size +"$SIZE"c -exec rm -v {} \;

echo "Deleted all files larger than $SIZE bytes in '$DIR'."
