#! /bin/bash

TOKEN="$1"
CHAT="$2"

while true; do
    while read -r update; do
        eval "$update"
        if   [ $new_id != null ]; then
            # Adding new user
            echo "$new_id $date" >> ./list
        elif [ $button != null ]; then
            # check if it's a correct button
            if grep "$from" ./list; then
                sed -i "/$from/d"
            fi
        else
            sleep 5
        fi
    done <\
         < curl -s -X GET "https://api.telegram.org/bot$token/getUpdates" \
            | jq -r '.result[] | "date=\(.message.date);new_id=\(.message.new_chat_participant.id);button=\(.message.callback_query.data);from=\(.message.callback_query.from.id)"'

