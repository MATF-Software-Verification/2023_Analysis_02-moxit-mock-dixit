#!/bin/bash

backend_src="src"
frontend_src="Main Window"

backend_build_dir="backend/build"
frontend_build_dir="frontend/src/lib/build"

output_file_backend="output_backend.txt"
output_file_frontend="output_frontend.txt"

if [ -d "$backend_build_dir" ]; then
    rm -rf $backend_build_dir
fi

if [ -d "$frontend_build_dir" ]; then
    rm -rf $frontend_build_dir
fi

mkdir $backend_build_dir
cd $backend_build_dir

cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../$backend_src
make

run-clang-tidy -p . -header-filter=".*"  2>&1 | tee "../../$output_file_backend"

cd ../..

mkdir $frontend_build_dir
cd $frontend_build_dir 

cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../"$frontend_src"
make

cd .. 

run-clang-tidy -p build -header-filter=".*" "Main Window/*.cpp" "Main Window/*.h" "Chat/*.cpp" "Chat/*.h" "network_service/*.cpp" "network_service/*.hpp" 2>&1 | tee "../../../$output_file_frontend"

cd ../../..

rm -rf $backend_build_dir
rm -rf $frontend_build_dir

