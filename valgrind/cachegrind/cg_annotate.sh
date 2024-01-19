#!/bin/bash

if [ $1 == "-k" ]; then
    	echo "u if*-u"
    	flag="k"
fi

run_cg_annotate(){
for input_file in cachegrind.out.*; do
    pid=$(echo "$input_file" | sed 's/cachegrind.out.//')
    
    if [ $flag == k ]; then
    	echo "if for petlja"
    	kcachegrind cachegrind.out.$pid
    fi
    
    output_file="cachegrind_$pid.txt"

    cg_annotate "$input_file" > "$output_file"
    echo "Command executed for $input_file. Output written to $output_file."
done
}

cd frontend/src/lib/build
run_cg_annotate

cd ../../../../backend/build
run_cg_annotate
