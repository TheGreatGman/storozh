#! /bin/bash

TOKEN="$1"
TIMEOUT="$2"

while true; do
    while read -r update; do
        echo -n "Parsing update..."
        eval "$update" && \
            echo "Done"
        if   [ $new_id != null ]; then
            echo -n "Found new user, adding to list..."
            if grep -q "$new_id" ./list; then
                echo "Skipped."
            else
                echo "$new_id $date" >> ./list && \
                    echo "Done"
            fi
        elif [ $button != null ]; then
            echo -n "Button was pressed, "
            # TODO check if it's a correct button
            if grep -q "$from" ./list; then
                echo -n " correct user. Removing from the list..."
                sed -i "/$from/d" && \
                echo "Done"
            else
                echo "wrong user"
            fi
        else
            sleep 5
        fi
    done <\
         <(curl -s -X GET "https://api.telegram.org/bot$TOKEN/getUpdates" \
         | jq -r '.result[] | "date=\(.message.date);new_id=\(.message.new_chat_participant.id);button=\(.message.callback_query.data);from=\(.message.callback_query.from.id);check=\(.message.callback_query.message.reply_to_message.from)"')
 done
