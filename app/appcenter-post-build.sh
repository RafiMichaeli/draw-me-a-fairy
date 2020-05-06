#!/usr/bin/env bash
if [[ "$APPCENTER_XCODE_PROJECT" ]]; then
  curl https://upload.testfairy.com/api/upload \
    -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
    -F "file=@$APPCENTER_OUTPUT_DIRECTORY/draw-me-a-fairy.ipa" 
fi

if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then
  curl https://upload.testfairy.com/api/upload \
    -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
    -F "file=@$APPCENTER_OUTPUT_DIRECTORY/app-staging.apk"
fi
