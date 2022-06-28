ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif

# Update this value when you upgrade the version of your project.
VERSION ?= 0.6.0

.PHONY: help all
help:
	@grep -hE '^[a-zA-Z0-9\._/-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: changelog git-chglog
changelog: git-chglog ## Generate a Changelog for next version read from the git tags
	$(GIT_CHGLOG) --next-tag v$(VERSION) > CHANGELOG.md

git-chglog: ## Download git-chglog locally if necessary.
ifeq (,$(shell which git-chglog 2>/dev/null))
	@{ \
	set -ex ;\
	go get -u github.com/git-chglog/git-chglog/cmd/git-chglog ;\
	}
endif
GIT_CHGLOG = $(shell which git-chglog)
