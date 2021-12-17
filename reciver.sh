#! /bin/bash

TOKEN="$1"
CHAT="$2"
while true; do
    answer=$( curl -s -X GET "https://api.telegram.org/bot$TOKEN/getUpdates" | jq

