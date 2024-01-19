#!/bin/bash

set -xe

frontend_src="frontend/src/lib/Main Window"

frontend_build_dir="frontend/src/lib/build"

run_cachegrind() {
    local target_name=$1

    echo "Running cachegrind on $target_name..."s
    valgrind --tool=cachegrind --keep-debuginfo=yes --cache-sim=yes "./$target_name"
}

if [ -d "$frontend_build_dir" ]; then
    rm -rf $frontend_build_dir
fi

mkdir $frontend_build_dir
cd $frontend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "../Main Window"
make > /dev/null

run_cachegrind Moxit

echo "Cachegrind analysis completed."

cd ..

rm -rf $frontend_build_dir
