#!/bin/sh
pemfile=$1

token='xxxxx'
pushData='{"aps": {"alert": "xxxxx"}}'
# pushData='{
#    "aps" : {
#       "content-available" : 1
#    },
#    "acme1" : "bar",
#    "acme2" : 42
# }'
#
bundleIdentifier='bundle.identifier'

appleUri='https://api.development.push.apple.com/3/device/'

curl -v \
-d "$pushData" \
-H "apns-priority: 10" \
-H "apns-expiration: 0" \
-H "apns-topic: ${bundleIdentifier}" \
--http2 \
--cert ${pemfile} \
${appleUri}${token}
