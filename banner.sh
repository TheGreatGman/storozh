#!/bin/bash
TOKEN="$1"
CHAT="$2"
while read -r word1 word2 ; do
difference=(($(date +%s) - $word2))
    if $(($difference > 60))
     then
     $curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" -d chat_id=$chat -d user_id=$word1 -d revoke_messages=True
     fi
done < ./list
