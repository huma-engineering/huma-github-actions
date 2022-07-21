ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif

# Update this value when you upgrade the version of your project.
VERSION ?= 0.7.1

.PHONY: help all
help:
	@grep -hE '^[a-zA-Z0-9\._/-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: changelog
GIT_CHGLOG=git-chglog
JIRA_TASK_PATH:=https://medopadteam.atlassian.net/browse/
changelog: ## Generate a Changelog for versions read from the Git tags.
	$(call go-get-tool,$(GIT_CHGLOG),github.com/git-chglog/git-chglog/cmd/git-chglog@latest)
	tools/scripts/generate-changelog.sh ${VERSION} ${JIRA_TASK_PATH}
