from conans import ConanFile, tools
import os


class CerealConan(ConanFile):
    name = "cereal"
    version = "1.2.2"
    description = "Serialization header-only library for C++11."
    homepage = "https://github.com/USCiLab/cereal"
    license = "BSD-3"
    no_copy_source = True
    options = {"thread_safe": [True, False]}
    default_options = "thread_safe=False"
    source_subfolder = "sources"
    url = "https://github.com/conan-community/conan-cereal"

    def source(self):
        source_url = ("%s/archive/v%s.zip" % (self.homepage, self.version))
        tools.get(source_url)
        os.rename("%s-%s" % (self.name, self.version, ), self.source_subfolder)

    def package(self):
        src_include = os.path.join(self.source_subfolder, "include")
        self.copy("*.h", dst="include", src=src_include)
        self.copy("*.hpp", dst="include", src=src_include)
        self.copy("*LICENSE*", dst="licenses", src=self.source_subfolder)

    def package_id(self):
        self.info.header_only()

    def package_info(self):
        if self.options.thread_safe:
            self.cpp_info.defines = ["CEREAL_THREAD_SAFE=1"]
