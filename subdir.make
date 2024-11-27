# Makefile for subdirectory

.PHONY: all build clean update-deps

all: build

build:
	fix build

clean:
	fix clean
	rm -rf *.out

update-deps:
	fix deps update
