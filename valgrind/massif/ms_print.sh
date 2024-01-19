#!/bin/bash

run_ms_print(){
# Iterate over files matching the pattern
for input_file in massif.out.*; do
    # Extract some_number from the input file name
    pid=$(echo "$input_file" | sed 's/massif.out.//')

    # Create the corresponding output file name
    output_file="massif_$pid.txt"

    # Run the ms_print command
    ms_print "$input_file" > "$output_file"
    echo "Command executed for $input_file. Output written to $output_file."
done
}

cd massif_frontend
run_ms_print

cd ../massif_backend
run_ms_print
