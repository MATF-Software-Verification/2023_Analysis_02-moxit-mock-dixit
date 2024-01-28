#!/bin/bash

set -xe

frontend_build_dir="frontend/src/lib/build"

stack="no"

# Function to run massif on a target
run_massif() {
    local target_name=$1
    local include_stack=$2

    echo "Running massif on $target_name..."
    valgrind --tool=massif --stacks=$include_stack "./$target_name"
}

if [ ! -d "massif_frontend" ]; then
    mkdir massif_frontend
fi

cd massif_frontend

if [ $# == 1 ]; then
   stack=$1
fi

# Run massif on the backend
run_massif ../$frontend_build_dir/Moxit $stack

echo "Massif analysis completed."
