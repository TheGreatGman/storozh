#! /bin/bash

TOKEN=""
CHAT=""
TIMEOUT="5"

cd "$(dirname "$(realpath "$0")")"


pgrep "reciver.sh" && pkill reciver.sh
pgrep "banner.sh"  && pkill banner.sh


./reciver.sh "$TOKEN" "$TIMEOUT" &
./banner.sh  "$TOKEN" "$CHAT" &
