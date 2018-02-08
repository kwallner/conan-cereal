from conan.packager import ConanMultiPackager


if __name__ == "__main__":
    builder = ConanMultiPackager(use_docker=True)
    builder.add(settings={
        'os': 'Linux',
        'compiler.version': '5',
        'compiler.libcxx': 'libstdc++11',
        'arch': 'x86_64',
        'build_type': 'Release',
        'compiler': 'gcc'
    })
    builder.run()
