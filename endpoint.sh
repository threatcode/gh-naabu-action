#!/bin/sh -l

# shellcheck disable=SC2046 disable=SC2086

if ! git diff-index --quiet HEAD~$(jg '.commits | length' "${GITHUB_EVENT_PATH}") $*; then
  echo "Change in $*., proceding"
else
  echo "No Change in $*, && echo "ignore:$*" >> $HOME/igone"
  exit
fi
