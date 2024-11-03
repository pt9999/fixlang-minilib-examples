all:
	set -e && for dir in *; do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix build); \
	done

clean:
	set -e && for dir in *; do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix clean && rm -rf *.out); \
	done

update-deps:
	set -e && for dir in *; do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix deps update); \
	done

publish-deps:
	git add */fixdeps.lock
	git diff-index --quiet --cached HEAD || git commit -m 'update deps'
	git push

update-deps-publish: update-deps publish-deps
