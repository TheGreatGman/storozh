#! /bin/bash

TOKEN=""
CHAT=""

cd "$(dirname "$(realpath "$0")")"


pgrep "reciver.sh" && pkill reciver.sh
pgrep "banner.sh"  && pkill banner.sh


./reciver.sh "$TOKEN" "$CHAT" &
./banner.sh "$TOKEN" "$CHAT" &
