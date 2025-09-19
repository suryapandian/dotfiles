#!/bin/bash

LOG_FILE="$HOME/Library/Logs/cargo_clean_task.log"

echo "$(date): Starting cargo clean-all..." >> "$LOG_FILE"

cd /Users/suryapandian/repo/tl
docker system prune --all --volumes --force
echo "docker pruned"
cargo clean-all --keep-days 2 ~ --yes  
echo "cargo cleaned"
