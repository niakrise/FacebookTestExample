#!/bin/sh

if [ -z "$1" ]; then
	echo "You must specify target device, for example: \"platform=iOS Simulator,OS=10.3,name=iPhone 6\""
	exit 0
fi

pod install

TARGET_DEVICE="$1"

xcodebuild CODE_SIGNING_REQUIRED=NO \
-sdk iphonesimulator \
-destination "${TARGET_DEVICE}" \
-workspace FacebookTestExample.xcworkspace \
-scheme "FacebookTestExample" \
-configuration Debug
