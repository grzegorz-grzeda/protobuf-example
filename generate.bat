@echo off
REM Set the paths to the protobuf and nanopb directories
set NANOPB_PATH=nanopb\generator\nanopb_generator.py
set PROTOC_PATH=nanopb\generator\protoc

REM Set the input and output directories
set PROTO_FILES_DIR=protocol
set OUTPUT_DIR_C=embedded_c
set OUTPUT_DIR_PYTHON=cloud_python

REM Create the output directory if it doesn't exist
if not exist %OUTPUT_DIR_C% (
    mkdir %OUTPUT_DIR_C%
)

REM Generate the protobuf files for C
for %%f in (%PROTO_FILES_DIR%\*.proto) do (
    python %NANOPB_PATH% -D %OUTPUT_DIR_C% %%f
)

REM Generate the protobuf files for python
for %%f in (%PROTO_FILES_DIR%\*.proto) do (
    %PROTOC_PATH% --python_out=%OUTPUT_DIR_PYTHON% %%f
)

echo Protobuf files generated successfully.