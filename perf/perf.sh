#!/bin/bash

set -xe

frontend_build_dir="frontend/src/lib/build"

run_perf() {
    local target_name=$1

    echo "Running perf on $target_name..."s

    sudo perf record --call-graph dwarf $target_name
    sudo perf report

}

run_perf "$frontend_build_dir/Moxit"

