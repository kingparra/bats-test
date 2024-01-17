#!/usr/bin/env bats
# This is a minimal example of how to write a test using bats.
# You can find a more complete example in the tutorial:
# https://bats-core.readthedocs.io/en/stable/tutorial.html


setup() {
  # You can import modules and do general setup here.
  # https://bats-core.readthedocs.io/en/stable/writing-tests.html#setup-and-teardown-pre-and-post-test-hooks
  # You can load helper libs here, to get access to functions like assert_output.
  # Here's a list of all the lib names: https://github.com/bats-core
  load test_helper/bats-support/load
  load test_helper/bats-assert/load
  # Exported variables will be visible from the test cases
  PROJECT_ROOT="$(realpath "${BATS_TEST_FILENAME%/*}/../")"
  PATH="$PROJECT_ROOT/src:$PATH"
}


@test "Check welcome message" {
  message() {
    # discard stderr since we only want to compare the message
    project.sh 2>/dev/null
  }
  # run assigns the stdin and stderr of message to $output, and the exit code to $status
  run message
  # assert_output compares the value of the $output var to its arguments
  assert_output "Welcome to our project!"
}


@test "Check welcome message using partial" {
  run project.sh
  # Only test for substring match in $output using the --partial option
  # https://github.com/bats-core/bats-assert#partial-matching
  assert_output --partial "Welcome to our project!"
}


teardown() {
  # Anything you put in here will be run after each individual unit test
  # You can use this to clean up tmpfiles or close network connections, for example
  true
}

