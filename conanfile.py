from conans import ConanFile, CMake, tools
import os


class CerealConan(ConanFile):
    name = "cereal"
    version = "1.2.2"
    description = "Serialization header-only library for C++11."
    exports_sources = ["LICENSE"]
    license = "Boost Software License 1.0"
    source_subfolder = "sources"
    url = "https://github.com/USCiLab/cereal"

    def source(self):
        source_url = ("%s/archive/v%s.zip" % (self.url, self.version))
        tools.get(source_url)
        os.rename("%s-%s" % (self.name, self.version, ), self.source_subfolder)

    def package(self):
        self.copy("*LICENSE*", dst="licenses", src="sources")
        self.copy("*.h", dst=".", src="sources")
        self.copy("*.hpp", dst=".", src="sources")

    def package_id(self):
        self.info.header_only()
