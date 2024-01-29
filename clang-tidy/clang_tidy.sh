#!/bin/bash

backend_build_dir="backend/build"
frontend_build_dir="frontend/src/lib/build"

output_file_backend="output_backend.txt"
output_file_frontend="output_frontend.txt"

cd $backend_build_dir

run-clang-tidy -p . -header-filter=".*"  2>&1 | tee "../../$output_file_backend"

cd  ../../frontend/src/lib/

run-clang-tidy -p build -header-filter=".*" "Main Window/*.cpp" "Main Window/*.h" "Main Window/fmt/include/fmt*.h" "Main Window/fmt/src*.cc" "Chat/*.cpp" "Chat/*.h" "network_service/*.cpp" "network_service/*.hpp" 2>&1 | tee "../../../$output_file_frontend"

