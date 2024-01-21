#!/bin/bash

if [ $# -gt 0 ] && [ "$1" = "-k" ]; then
    	echo "if"
    	flag=k
fi

run_cg_annotate(){
for input_file in cachegrind.out.*; do
    pid=$(echo "$input_file" | sed 's/cachegrind.out.//')
    
    if [ "$flag" = "k" ]; then
    	echo "if for petlja"
    	kcachegrind cachegrind.out.$pid
    fi
    
    output_file="cachegrind_$pid.txt"

    cg_annotate "$input_file" > "$output_file"
    echo "Command executed for $input_file. Output written to $output_file."
done
}

cd cachegrind_backend
run_cg_annotate

cd ../cachegrind_frontend
run_cg_annotate
