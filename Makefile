all:
	set -e && for dir in $(EXAMPLES); do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix build); \
	done

clean:
	set -e && for dir in $(EXAMPLES); do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix clean && rm -rf *.out); \
	done

update-deps:
	set -e && for dir in $(EXAMPLES); do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix deps update); \
	done

publish-deps:
	git add $(EXAMPLES:%=%/fixdeps.lock)
	git diff-index --quiet --cached HEAD || git commit -m 'update deps'
	git push

update-deps-publish: update-deps publish-deps

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
