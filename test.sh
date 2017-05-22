#!/bin/sh

if [ -z "$1" ]; then
	echo "You must specify target device, for example: \"platform=iOS Simulator,OS=10.3,name=iPhone 6\""
	exit 0
fi

TARGET_DEVICE="$1"

xcodebuild  test \
-destination "${TARGET_DEVICE}" \
-workspace FacebookTestExample.xcworkspace \
-scheme "FacebookTestExample"