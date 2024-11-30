#!/bin/bash
NANOPB_PATH=nanopb/generator/nanopb_generator.py
PROTOC_PATH=nanopb/generator/protoc

PROT_FILES_DIR=protocol
OUTPUT_DIR_C=embedded_c
OUTPUT_DIR_PYTHON=cloud_python

git submodule update --init --recursive
pip install  protobuf grpcio-tools

for file in $PROT_FILES_DIR/*.proto
do
    python $NANOPB_PATH -D $OUTPUT_DIR_C $file
    $PROTOC_PATH --python_out=$OUTPUT_DIR_PYTHON $file
done

cmake -B build -S . -GNinja
cmake --build build