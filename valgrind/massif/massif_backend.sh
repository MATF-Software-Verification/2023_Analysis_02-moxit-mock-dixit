#!/bin/bash

set -xe

backend_src="backend/src"

backend_build_dir="build_backend"

stack="no"

run_massif() {
    local target_name=$1
    #local output_dir=$2
    local include_stack=$2

    echo "Running massif on $target_name..."
    valgrind --tool=massif --stacks=$include_stack "./$target_name"
}

if [ -d "$backend_build_dir" ]; then
    rm -rf $backend_build_dir
fi

mkdir $backend_build_dir
cd $backend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../$backend_src
make > /dev/null

if [ ! -d "../massif_backend" ]; then
    mkdir ../massif_backend
fi

cd ../massif_backend

if [ $# == 1 ]; then
   stack=$1
fi

run_massif ../build_backend/moxit-backend $stack

echo "Massif analysis completed."

