#!/bin/bash

set -e
PULL_REQUEST= 'https://github.com/wnjenkin/react'

yarn test --coverage --maxWorkers=2
if [ -z "$PULL_REQUEST" ]; then
  ./node_modules/.bin/coveralls < ./coverage/lcov.info
fi

# TODO: should we also track prod code coverage somehow?
# yarn test-prod --coverage
