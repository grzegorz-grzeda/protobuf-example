@echo off
REM Set the paths to the protobuf and nanopb directories
set NANOPB_PATH=nanopb\generator\nanopb_generator.py
set PROTOC_PATH=nanopb\generator\protoc

REM Set the input and output directories
set PROTO_FILES_DIR=protocol
set OUTPUT_DIR_C=embedded_c
set OUTPUT_DIR_PYTHON=cloud_python

echo Initialize GIT submodules and install dependencies
git submodule update --init --recursive
pip install --upgrade protobuf grpcio-tools

echo Generating library ProtoBuf files for C
for %%f in (%PROTO_FILES_DIR%\*.proto) do (
    python %NANOPB_PATH% -D %OUTPUT_DIR_C% %%f
)

echo Configure and build C project
cmake -B build -S . -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build build

echo Generate library ProtoBuf files for Python
for %%f in (%PROTO_FILES_DIR%\*.proto) do (
    echo Generating library ProtoBuf files for %%f
    %PROTOC_PATH% --python_out=%OUTPUT_DIR_PYTHON% %%f
)
