#!/bin/bash

set -xe

frontend_src="frontend/src/lib/Main Window"

frontend_build_dir="build_frontend"

stack="no"

run_massif() {
    local target_name=$1
    #local output_dir=$2
    local include_stack=$2

    echo "Running massif on $target_name..."
    valgrind --tool=massif --stacks=$include_stack "./$target_name"
}

if [ -d "$frontend_build_dir" ]; then
    rm -rf $frontend_build_dir
fi

mkdir $frontend_build_dir
cd $frontend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../"$frontend_src"
make > /dev/null

if [ ! -d "../massif_frontend" ]; then
    mkdir ../massif_frontend
fi

cd ../massif_frontend

if [ $# == 1 ]; then
   stack=$1
fi

run_massif ../build_frontend/Moxit $stack

echo "Massif analysis completed."

cd ..

rm -rf $frontend_build_dir
