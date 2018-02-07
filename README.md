# conan-cereal

[ ![Download](https://api.bintray.com/packages/conan-community/conan/cereal%3Aconan/images/download.svg?version=1.2.2%3Astable) ](https://bintray.com/conan-community/conan/cereal%3Aconan/1.2.2%3Astable/link)
[![Build Status](https://travis-ci.org/conan-community/conan-cereal.svg?branch=testing%2F1.2.2)](https://travis-ci.org/conan-community/conan-cereal)


[Conan.io](https://conan.io) package for [cereal](https://github.com/USCiLab/cereal) project.

The packages generated with this *conanfile.py* can be found in [Bintray](https://bintray.com/conan-community/conan/cereal%3Aconan).

## Basic setup

    $ conan install cereal/1.2.2@conan/stable

## Project setup

If you handle multiple dependencies in your project is better to add a *conanfile.txt*:

    [requires]
    cereal/1.2.2@conan/stable

    [generators]
    txt
    cmake

## License

[MIT License](LICENSE)