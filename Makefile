EXAMPLES = \
	calc_pi \
	fractal_server \
	grep \
	json_cat \
	probable_primes \
	sample_client \
	sample_http_server \
	sample_server \
	spell_checker \
	sudoku

SUBDIR_MAKEFILE = $$(pwd)/subdir.make

.PHONY: all build clean publish
.SUFFIXES: .build .clean .publish

all: build

build: $(EXAMPLES:%=%.build)
clean: $(EXAMPLES:%=%.clean)
publish: $(EXAMPLES:%=%.publish) publish-deps

%.build:
	make -C $* -f $(SUBDIR_MAKEFILE) build

%.clean:
	make -C $* -f $(SUBDIR_MAKEFILE) clean

%.publish: 
	make -C $* -f $(SUBDIR_MAKEFILE) clean update-deps build

.PHONY: publish-deps
publish-deps:
	git add $(EXAMPLES:%=%/fixdeps.lock)
	git diff-index --quiet --cached HEAD || git commit -m 'update deps'
	git push
