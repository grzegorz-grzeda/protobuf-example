cmake_minimum_required(VERSION 3.25)
project(protobuf-example-embedded-c)

add_executable(${PROJECT_NAME})

add_subdirectory(embedded_c)

add_subdirectory(nanopb)

target_link_libraries(${PROJECT_NAME} PRIVATE protobuf-nanopb-static)

target_include_directories(${PROJECT_NAME} PRIVATE nanopb)