#!/bin/bash

set -xe

backend_src="backend/src"

backend_build_dir="backend/build"

run_cachegrind() {
    local target_name=$1

    echo "Running cachegrind on $target_name..."
    valgrind --tool=cachegrind --keep-debuginfo=yes --cache-sim=yes "./$target_name"
}

if [ -d "$backend_build_dir" ]; then
    rm -rf $backend_build_dir
fi

mkdir $backend_build_dir
cd $backend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../src
make > /dev/null

run_cachegrind moxit-backend

echo "Cachegrind analysis completed."
