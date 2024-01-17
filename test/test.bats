#!/usr/bin/env bats
PATH="${BATS_TEST_FILENAME%/*}/../src:$PATH"

@test "can run our script" {
  project.sh
}
