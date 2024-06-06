#!/bin/bash
set -e

function main {
  install_git_hooks
  check_dependencies
}

function install_git_hooks {
  echo "Installing git hooks..."
  git config core.hooksPath scripts/hooks
  git config blame.ignoreRevsFile .git-blame-ignore-revs
}

function check_dependencies {
  #TODO
  true
}

main
