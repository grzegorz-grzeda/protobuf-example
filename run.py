from subprocess import run
from os import path
from sys import argv

PROTOCOL_FILES = [
    'protocol/MessageRequest.proto'
]

OUTPUT_DIR = 'embedded_c'
GENERATED_C_LIBRARY = 'protocol'


def get_script_path():
    return path.dirname(path.realpath(argv[0]))


def generate_proto_file(proto_file, output_dir):
    args = ['python', 'nanopb/generator/nanopb_generator.py',
            f'{proto_file}',
            f'-D {get_script_path()}\\{output_dir}']
    print(args)
    print(get_script_path())
    run(args, cwd=get_script_path(), shell=True)


def generate_cmake_file(proto_files, output_dir):
    with open(f'{OUTPUT_DIR}/CMakeLists.txt', 'w') as file:
        file.write(f'project({GENERATED_C_LIBRARY})\n')
        file.write('add_library(${PROJECT_NAME} STATIC\n')
        for proto_file in proto_files:
            file.write(
                f'target_sources(${PROJECT_NAME} PRIVATE {proto_file}.c)\n')
        file.write(
            'target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})\n')


def main():
    print('Project Initialize')
    for file in PROTOCOL_FILES:
        print(f'Generating {file} C library')
        generate_proto_file(file, OUTPUT_DIR)
    print('Project Initialized')


if __name__ == '__main__':
    main()
