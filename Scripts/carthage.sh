#!/usr/bin/env bash 

# carthage.sh
# Usage example: ./carthage.sh build --platform iOS

set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

## optional
echo 'IPHONEOS_DEPLOYMENT_TARGET = 11.0' >> $xcconfig
echo "ENABLE_BITCODE=NO" >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"
carthage "$@"