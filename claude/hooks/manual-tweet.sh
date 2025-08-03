#!/bin/bash

# Manual tweet logger for Claude Code sessions
# Usage: cc "your thought here"

# Check if argument provided
if [ $# -eq 0 ]; then
    echo "使い方: cc \"つぶやきたいこと\""
    exit 1
fi

# Get current timestamp and date
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

# Add the tweet
echo "- $timestamp $*" >> "$log_file"

echo "記録しました: $*"
