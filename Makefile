SED = $(shell which gsed || which sed)
VERSION = $(shell cat VERSION)

.PHONY: build
build: sdist wheel

.PHONY: sdist
sdist:
	PYTHONDONTWRITEBYTECODE= python setup.py sdist

.PHONY: wheel
wheel:
	PYTHONDONTWRITEBYTECODE= python setup.py bdist_wheel

.PHONY: test
test:
	tox

.PHONY: release
release: test build git-check version-check
	PYTHONDONTWRITEBYTECODE= python setup.py sdist bdist_wheel upload -r pypi

.PHONY: git-check
git-check:
	@git diff-index --quiet HEAD || \
	  (git status --long -uall \
	    && echo '\nERROR: Commit existing changes, then try again.' \
	    && exit 1)
	@echo Git worktree is clean.

.PHONY: version-check
version-check:
	@pip install string-parser==999999 2>&1 >/dev/null \
	    | $(SED) -nEe '/\b$(VERSION)\b/q42' || \
	  (echo ERROR: '${VERSION}' already exists. \
	    && exit 1)
	@echo Version $(VERSION) is unique.

.PHONY: clean
clean:
	python setup.py clean --all
