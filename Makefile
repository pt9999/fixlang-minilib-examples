all:
	set -e && for dir in *; do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix build); \
	done

clean:
	set -e && for dir in *; do \
		[ ! -d $$dir ] || (echo $$dir && cd $$dir && fix clean && rm -rf *.out); \
	done
