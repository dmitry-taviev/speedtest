#!/bin/bash

directory="$HOME/speedtest/$(date --rfc-3339=date)"
mkdir -p $directory
filename="$directory/$(date +%H.%M.%S).json"
speed_local=$(speedtest --simple | grep -E '([0-9]+\.[0-9]+)\sMbit' -m 1 -o)
speed_global=$(speedtest --simple --server 8881 | grep -E '([0-9]+\.[0-9]+)\sMbit' -m 1 -o)
cat > $filename << EOL
{
	"local": "${speed_local}",
	"global": "${speed_global}"
}
EOL