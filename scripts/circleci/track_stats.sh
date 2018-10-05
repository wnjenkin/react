!/bin/bash

set -e

ALL_FILES=$(find packages -name '*.js' | grep -v umd/ | grep -v __tests__ | grep -v __mocks__)
echo 1
COUNT_ALL_FILES=$(echo "$ALL_FILES" | wc -l)
echo 2
COUNT_WITH_FLOW=$(grep '@flow' $ALL_FILES | perl -pe 's/:.+//' | wc -l)
echo 3
node scripts/facts-tracker/index.js "flow-files" "$COUNT_WITH_FLOW/$COUNT_ALL_FILES"
