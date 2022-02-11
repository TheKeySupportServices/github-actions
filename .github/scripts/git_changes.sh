#!/usr/bin/env bash

touch GIT_CHANGES
git log HEAD^..HEAD --pretty="%h %an - %s" > app/GIT_CHANGES
git show -s --format=%H > app/GIT_COMMIT

GIT_COMMIT="$(sed -n '1p' 'app/GIT_COMMIT')"

LAST_CHANGES="$(cat 'app/GIT_CHANGES')"
VERSION="$(sed -n '1p' 'version.txt')"

echo "VERSION=$VERSION" >> $GITHUB_ENV
echo "GIT_COMMIT=$GIT_COMMIT" >> $GITHUB_ENV
echo "LAST_CHANGES=$LAST_CHANGES" >> $GITHUB_ENV