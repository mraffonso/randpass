BUILD_PATH = ./build
OUT_FILE = $(BUILD_PATH)/randpass
BUILD_ARGS = --release --no-debug -o $(OUT_FILE)

.PHONY: all randpass

all: randpass

clean:
	rm -f build/*

randpass: src/randpass.cr
	mkdir -p build
	crystal build $(BUILD_ARGS) src/randpass.cr
	strip $(OUT_FILE)
