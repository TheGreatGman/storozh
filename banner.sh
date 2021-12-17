#!/bin/bash
TOKEN="$1"
CHAT="$2"
while read -r word1 word2 ; do
    echo "$word1|$word2"
difference=$(($(date +%s) - $word2))
    if (($difference > 60))
     then
     curl -s -X POST "https://api.telegram.org/bot$TOKEN/banChatMember" -d chat_id=$CHAT -d user_id=$word1 -d revoke_messages=True
     fi
done < ./list
