cmake_minimum_required(VERSION 3.25.0)
project(hell)
include(function.cmake)
message("Hi no need to run very first command to configure")
#fooKeyword(germany munich)
add_executable(${PROJECT_NAME} hello.c)
#add_link_options(LINKER:-t,$<TARGET_PROPERTY:NAME>.dp)
#add_link_options(LINKER:-Map,$<TARGET_PROPERTY:NAME>.map,-O1,--hash-style=gnu,--as-needed)
generate_debug_symbols(${PROJECT_NAME})
message("File executed successfully")
message("prject name is : ${PROJECT_NAME}")
message("Added one more line in cmakelists.txt")
# cmake command to run
#cmake -G"MinGW Makefiles" -DCMAKE_SIZE="C:\MinGW\bin\size.exe" ..