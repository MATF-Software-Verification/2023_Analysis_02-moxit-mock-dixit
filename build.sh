#!/bin/bash

set -xe

backend_src="src"
backend_build_dir="backend/build"

frontend_src="Main Window"
frontend_build_dir="frontend/src/lib/build"

mkdir $backend_build_dir
cd $backend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../$backend_src
make > /dev/null

cd ../..

mkdir $frontend_build_dir
cd $frontend_build_dir

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../"$frontend_src"
make > /dev/null

