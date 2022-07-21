#!/usr/bin/env bash
# Generate a Changelog for versions read from the Git tags.
#
# ref: https://www.baeldung.com/linux/sed-substitution-variables
# `sort -ur` sorts unique in reverse order
VERSION=${1}
JIRA_TASK_PATH=${2}
res=$(git-chglog --next-tag v${VERSION})
code=$?
[ ${code} -ne 0 ] && exit ${code}
echo "${res}" > CHANGELOG.md
cat CHANGELOG.md | grep -oE 'HCB-[0-9]{2,5}' | sort -ur | \
  sed -E "s#(.*)#[\1]: $JIRA_TASK_PATH\1#" >> CHANGELOG.md
