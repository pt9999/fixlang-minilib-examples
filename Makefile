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

.PHONY: all build clean update-deps publish
.SUFFIXES: .build .clean .update-deps .publish

all: build

build: $(EXAMPLES:%=%.build)
clean: $(EXAMPLES:%=%.clean)
update-deps: $(EXAMPLES:%=%.update-deps)
publish: $(EXAMPLES:%=%.publish) regression-test publish-deps

%.build:
	make -C $* -f $(SUBDIR_MAKEFILE) build

%.clean:
	make -C $* -f $(SUBDIR_MAKEFILE) clean

%.update-deps:
	make -C $* -f $(SUBDIR_MAKEFILE) clean update-deps

%.publish: 
	make -C $* -f $(SUBDIR_MAKEFILE) clean update-deps build

.PHONY: publish-deps
publish-deps:
	git add $(EXAMPLES:%=%/fixdeps.lock)
	git diff-index --quiet --cached HEAD || git commit -m 'update deps'
	git push

regression-test:
	(cd calc_pi && bash ./regression.sh)
	(cd grep && bash ./regression.sh)
	(cd json_cat && bash ./regression.sh)
	(cd probable_primes && bash ./regression.sh)
	(cd sudoku && bash ./regression.sh)