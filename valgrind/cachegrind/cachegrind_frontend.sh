#!/bin/bash

set -xe

frontend_build_dir="frontend/src/lib/build"
cachegrind_dir="cachegrind_frontend"

run_cachegrind() {
    local target_name=$1

    echo "Running cachegrind on $target_name..."s
    valgrind --tool=cachegrind --keep-debuginfo=yes --cache-sim=yes "./$target_name"
}

if [ ! -d "$cachegrind_dir" ]; then
    mkdir $cachegrind_dir
fi

cd $cachegrind_dir

run_cachegrind ../$frontend_build_dir/Moxit

echo "Cachegrind analysis completed."

