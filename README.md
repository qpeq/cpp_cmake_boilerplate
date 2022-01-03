# A C++ project boilerplate using cmake & conan. cookiecutter ready.

## Prerequisite

1. cmake 3.16 or later
2. [cookiecutter](https://github.com/cookiecutter/cookiecutter)


## Build and Run

1. Create a new project using cookiecutter:
```shell
$ cookiecutter https://github.com/qpeq/cpp_cmake_boilerplate.git
```

2. You will be asked to give the project a name:
```shell
project_name [HelloWorld]:
```

3. Give the project a more detailed description:
```shell
project_description [An awesome C++ project]:
```

4. Provide the project an initial version:
```shell
project_version [0.1.0]:
```

5. CMake's minimal version:
```shell
cmake_minimal_version [3.16]:
```

6. Choose a type for this project:
```shell
Select project_type:
1 - exe
2 - static
3 - shared
4 - header-only
Choose from 1, 2, 3, 4 [1]:
```

7. Define the C++ standard used in this project:
```shell
cpp_standard [17]:
```

8. The project is now ready. You can build the project and run the test.

## License

`cpp_cmake_boilerplate` is released under the MIT License. Use of this source code is governed by
a MIT License that can be found in the LICENSE file.