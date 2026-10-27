# Makefile for subdirectory

.PHONY: all build clean update-deps

BUILD_OPTS = --deny-deprecated

all: build

build:
	fix build $(BUILD_OPTS)

clean:
	fix clean
	rm -rf *.out

update-deps:
	fix deps update
