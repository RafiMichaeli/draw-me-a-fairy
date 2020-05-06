#!/usr/bin/env bash

TESTFAIRY_UPLOAD_API_KEY=2b7c2001126cbbfb221535b6e0d3728f2bf5d9f3

if [[ "$APPCENTER_XCODE_PROJECT" ]]; then
  curl https://upload.testfairy.com/api/upload \
  -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
  -F "file=@$APPCENTER_OUTPUT_DIRECTORY/example.ipa" 
fi

if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then
  curl https://upload.testfairy.com/api/upload \
  -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
  -F "file=@$APPCENTER_OUTPUT_DIRECTORY/app-regular-release.apk"
fi
