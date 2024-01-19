#!/bin/bash

run_ms_print(){
for input_file in massif.out.*; do
    pid=$(echo "$input_file" | sed 's/massif.out.//')

    output_file="massif_$pid.txt"

    ms_print "$input_file" > "$output_file"
    echo "Command executed for $input_file. Output written to $output_file."
done
}

cd massif_frontend
run_ms_print

cd ../massif_backend
run_ms_print
