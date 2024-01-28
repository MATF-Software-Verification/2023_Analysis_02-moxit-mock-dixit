#!/bin/bash

set -xe

backend_build_dir="backend/build"
cachegrind_dir="cachegrind_backend"

run_cachegrind() {
    local target_name=$1

    echo "Running cachegrind on $target_name..."
    valgrind --tool=cachegrind --keep-debuginfo=yes --cache-sim=yes "./$target_name"
}

if [ ! -d "$cachegrind_dir" ]; then
    mkdir $cachegrind_dir
fi

cd $cachegrind_dir

run_cachegrind ../$backend_build_dir/moxit-backend

echo "Cachegrind analysis completed."
