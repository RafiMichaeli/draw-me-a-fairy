#!/usr/bin/env bash
# Release version per env
ENVIRONMENT=Development APP_NAME=DMAF/DMAF-Mobile
# Get the message of the last commit using Git
COMMIT_MESSAGE=$(git log -1 HEAD --pretty=format:%s)
if [[ "$APPCENTER_XCODE_PROJECT" ]]; then
$APPCENTER_OUTPUT_DIRECTORY/symbols/
if [ "$APPCENTER_BRANCH" == "ios/staging" ]; then
-F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
-F "file=@$APPCENTER_OUTPUT_DIRECTORY/dmaf.ipa" \
-F "symbols_file=@$APPCENTER_OUTPUT_DIRECTORY/symbols/dmaf.dsym" \
#-F testers_groups='internal_ios' \
#-F notify='on' #-F 'release_notes=$COMMIT_MESSAGE'
-F tags=‘appcntr, ios’
# else
fi
fi
if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then
if [ "$APPCENTER_BRANCH" == "android/staging" ]; then
curl https://upload.testfairy.com/api/upload \
-F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \
-F "file=@$APPCENTER_OUTPUT_DIRECTORY/app-staging.apk" \
# -F symbols_file=@sample_mapping.txt \
#-F testers_groups='internal_android' \
#-F notify='on' #-F 'release_notes=$COMMIT_MESSAGE'
-F tags=‘appcntr,android’
fi
fi
