#acceptable build_types: Release/Debug/Profile
build_type=Release
# build_type=Debug

.SILENT:

all: build build/CMakeLists.txt.copy
	$(info Build_type is [${build_type}])
	$(MAKE) --no-print-directory -C build

clean:
	rm -rf build bin lib src/vector_display

build/CMakeLists.txt.copy: build CMakeLists.txt Makefile msg srv
	cd build && cmake -DCMAKE_BUILD_TYPE=$(build_type) ..
	cp CMakeLists.txt build/CMakeLists.txt.copy

build:
	mkdir -p build
