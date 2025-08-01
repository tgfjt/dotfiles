#!/bin/bash

# Claude Code tweet logger hook
# Logs thoughts and interactions to daily markdown files

# Read JSON input from stdin
json_input=$(cat)

# Extract event name and session info
event_name=$(echo "$json_input" | jq -r '.hook_event_name')
session_id=$(echo "$json_input" | jq -r '.session_id')
timestamp=$(date '+%H:%M')
date_stamp=$(date '+%Y-%m-%d')

# Set up paths
log_dir="/Users/tgfjt/ghq/github.com/tgfjt/memos/claude-tweets"
log_file="$log_dir/$date_stamp.md"

# Create directory if it doesn't exist
mkdir -p "$log_dir"

# Create file with header if it doesn't exist
if [ ! -f "$log_file" ]; then
    echo "# $date_stamp" > "$log_file"
    echo "" >> "$log_file"
fi

# Handle different events
case "$event_name" in
    "UserPromptSubmit")
        # Log prompt submission
        echo "- $timestamp [prompt] 新しいプロンプトを受信" >> "$log_file"
        ;;
    
    "Stop")
        # Log stop event
        echo "- $timestamp [stop] 返答完了" >> "$log_file"
        ;;
esac

# Always allow the action
echo '{"status": "allow"}'