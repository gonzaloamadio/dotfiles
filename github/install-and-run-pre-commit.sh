#!/usr/bin/env bash
set -euo pipefail

if [ -z "${GITHUB_ACTIONS:-}" ]; then
    echo "ERROR: This script is meant to be run in GitHub Actions exclusively -- execution aborted." >&2
    exit 1
fi

set -x

# Set up git client
# - Prevent "Host key verification failed" error on attempts to git clone internal repositories (f
#   (from: https://stackoverflow.com/a/68488180/2585632)
mkdir ~/.ssh
ssh-keyscan -H github.braintreeps.com >> ~/.ssh/known_hosts
# - Prevent git clone password prompts by providing credentials early on
#   (from: https://stackoverflow.com/a/57229018/2585632)
git config --global url."https://api:$GHE_TOKEN@github.yourdomain.com/".insteadOf "https://github.yourdomain.com/"
git config --global url."https://ssh:$GHE_TOKEN@github.yourdomain.com/".insteadOf "ssh://git@github.yourdomain.com/"
git config --global url."https://git:$GHE_TOKEN@github.yourdomain.com/".insteadOf "git@github.yourdomain.com:"

# Add GitHub workspace as safe directory
# See https://github.com/actions/runner/issues/2033 and https://github.com/actions/checkout/issues/766
git config --global --add safe.directory "${PWD}"

# Set up Pip config to reach Artifactory
pip3.9 config set "global.index-url" "YOUR_OWN_REPO_URL"
pip3.9 config set "global.extra-index-url" "https://pypi.python.org/simple"

# Install Pre-commit
pip3.9 install pre-commit~=3.0.2 'virtualenv<20.22.0'
pyenv rehash

# Run Pre-commit
pre-commit run "$@"
