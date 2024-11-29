# ProtoBuf example

## Prepare
```
git submodule update --init --recursive
pip install --upgrade protobuf grpcio-tools
```

## Generate code
```
generate.bat
```

## Compile C code
```
cmake -B build/ -S .
cmake -B build/ --build
```