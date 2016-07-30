#!/usr/bin/env bats

@test "mysql binary is found in PATH" {
  run which mysqladmin
  [ "$status" -eq 0 ]
}