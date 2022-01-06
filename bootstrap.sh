#!/usr/bin/env bash

# Install brew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# Install fnm
brew install fnm

# Install the most recent LTS Node version
fnm install "$(fnm ls-remote | grep -E  "\(.+\)" | tail -1)"
