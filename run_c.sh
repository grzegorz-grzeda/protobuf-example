#!/bin/bash

if [ ! -d "build" ]; then
    echo "Build directory not found. Run initialize.sh first."
    ./initialize.sh
fi

./build/protobuf-example-embedded-c