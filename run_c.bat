@echo off
if not exist build\ (
    echo C project build directory does not exist - running initialize.bat first
    initialize.bat
)

echo Running C project
build\protobuf-example-embedded-c.exe