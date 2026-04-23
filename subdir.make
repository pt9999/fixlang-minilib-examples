# Makefile for subdirectory

.PHONY: all build clean update-deps

BUILD_OPTS = $(if $(CIENV), --allow-preliminary-commands, )

all: build

build:
	fix build $(BUILD_OPTS)

clean:
	fix clean
	rm -rf *.out

update-deps:
	fix deps update
