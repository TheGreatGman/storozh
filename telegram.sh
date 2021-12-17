#!/bin/sh

#TOKEN=""
TOKEN=""
#       https://api.telegram.org/bot<ТОКЕН>/getUpdates
CHAT_ID=""
#MESSAGE="$*"

MESSAGE=$1

URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST "$URL" \
    -d chat_id=$CHAT_ID \
    -d text="$MESSAGE" \
    -d disable_web_page_preview=true \
    -d parse_mode=markdown
