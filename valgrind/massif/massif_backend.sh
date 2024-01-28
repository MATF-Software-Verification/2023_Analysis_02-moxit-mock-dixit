#!/bin/bash

set -xe

backend_build_dir="backend/build"

stack="no"

# Function to run massif on a target
run_massif() {
    local target_name=$1
    local include_stack=$2

    echo "Running massif on $target_name..."
    valgrind --tool=massif --stacks=$include_stack "./$target_name"
}

if [ ! -d "massif_backend" ]; then
    mkdir massif_backend
fi

cd massif_backend

if [ $# == 1 ]; then
   stack=$1
fi

# Run massif on the backend
run_massif ../$backend_build_dir/moxit-backend $stack

echo "Massif analysis completed."

