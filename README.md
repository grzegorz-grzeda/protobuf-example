# ProtoBuf example

## Prepare
- install Ninja (or use other build tool, e.g. MinGW GCC or other)
- run:
```
git submodule update --init --recursive
pip install --upgrade protobuf grpcio-tools
```

## Generate code
```
initialize.bat
```

## Compile C code
```
cmake -B build/ -S . -GNinja
cmake --build build/
```

## Run Python example first in one console
```
python cloud_python/protobuf_example_cloud_python.py
```

## Run C example second in another console
```
build\protobuf-example-embedded-c.exe
```