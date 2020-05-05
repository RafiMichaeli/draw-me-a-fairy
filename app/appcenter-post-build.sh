{\rtf1\ansi\ansicpg1252\cocoartf2512
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red230\green230\blue230;\red31\green83\blue248;
}
{\*\expandedcolortbl;;\cssrgb\c13333\c13333\c13333;\cssrgb\c92157\c92157\c92157;\cssrgb\c15686\c43137\c98039;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww25180\viewh13940\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
#!/usr/bin/env bash\cb1 \
\cb3 # Release version per env\cb1 \
\cb3 ENVIRONMENT=Development\cb1 \uc0\u8232 \cb3 APP_NAME=DMAF/DMAF-Mobile\cb1 \
\cb3 # Get the message of the last commit using Git\cb1 \uc0\u8232 \cb3 COMMIT_MESSAGE=$(git log -1 HEAD --pretty=format:%s)\cb1 \
\cb3 if [[ "$APPCENTER_XCODE_PROJECT" ]]; then\cb1 \
\cb3 $APPCENTER_OUTPUT_DIRECTORY/symbols/\cb1 \
\cb3 if [ "$APPCENTER_BRANCH" == "ios/staging" ]; then\cb1 \uc0\u8232 \cb3 -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \\\cb1 \uc0\u8232 \cb3 -F "file=@$APPCENTER_OUTPUT_DIRECTORY/dmaf.ipa" \\\cb1 \uc0\u8232 \cb3 -F "symbols_file=@$APPCENTER_OUTPUT_DIRECTORY/symbols/dmaf.dsym" \\\cb1 \uc0\u8232 \cb3 #-F testers_groups='internal_ios' \\\cb1 \uc0\u8232 \cb3 #-F notify='on'\cb1 \uc0\u8232 \cb3 #-F 'release_notes=$COMMIT_MESSAGE'\cb1 \uc0\u8232 \cb3 -F tags=\'91appcntr, ios\'92\cb1 \uc0\u8232 \cb3 # else\cb1 \uc0\u8232 \cb3 fi\cb1 \uc0\u8232 \cb3 fi\cb1 \uc0\u8232 \cb3 if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then\cb1 \
\cb3 if [ "$APPCENTER_BRANCH" == "android/staging" ]; then\cb1 \uc0\u8232 \cb3 curl\'a0{\field{\*\fldinst{HYPERLINK "https://upload.testfairy.com/api/upload"}}{\fldrslt \cf4 \ul \ulc4 https://upload.testfairy.com/api/upload}}\'a0\\\cb1 \uc0\u8232 \cb3 -F "api_key=$TESTFAIRY_UPLOAD_API_KEY" \\\cb1 \uc0\u8232 \cb3 -F "file=@$APPCENTER_OUTPUT_DIRECTORY/app-staging.apk" \\\cb1 \uc0\u8232 \cb3 # -F symbols_file=@sample_mapping.txt \\\cb1 \uc0\u8232 \cb3 #-F testers_groups='internal_android' \\\cb1 \uc0\u8232 \cb3 #-F notify='on'\cb1 \uc0\u8232 \cb3 #-F 'release_notes=$COMMIT_MESSAGE'\cb1 \uc0\u8232 \cb3 -F tags=\'91appcntr,android\'92\cb1 \uc0\u8232 \cb3 fi\cb1 \uc0\u8232 \cb3 fi\cb1 \
}