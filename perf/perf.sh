#!/bin/bash

set -xe

frontend_src="frontend/src/lib/Main Window"
frontend_build_dir="frontend/src/lib/build"

run_perf() {
    local target_name=$1

    echo "Running perf on $target_name..."s

    sudo perf record --call-graph dwarf -F 99 -g -o ../../../../perf.data -p $target_name
    sudo perf script -i ../../../../perf.data > ../../../../perf.folded

    cd ../../../../FlameGraph
    ./stackcollapse-perf.pl < ../perf.folded > ../perf.collapsed
    ./flamegraph.pl ../perf.collapsed > ../flamegraph.svg
}

if [ -d "$frontend_build_dir" ]; then
    rm -rf $frontend_build_dir
fi

mkdir $frontend_build_dir
cd $frontend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "../Main Window"
make > /dev/null

"./Moxit" & pid=$!

run_perf $pid

echo "Perf analysis completed."

cd ..

rm -rf $frontend_build_dir
