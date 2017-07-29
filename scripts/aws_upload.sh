#!/bin/bash
set -ev
if [ "${TRAVIS_PULL_REQUEST}" = "true" ]; then
  S3_BUCKET="pr.emilyburch.com"
elif [ "${TRAVIS_BRANCH}" = "develop" ]; then
  S3_BUCKET="test.emilyburch.com"
elif [ "${TRAVIS_BRANCH}" = "master" ]; then
  S3_BUCKET="emilyburch.com"
  INVALIDATE="true"
fi

aws s3 sync --acl "public-read" --sse "AES256" public/ s3://$S3_BUCKET

if [ "$INVALIDATE" = "true" ]; then
  aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths /index.html / /page/*
fi
