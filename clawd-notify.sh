#!/bin/bash
#
# clawd-notify - Send a message to the main OpenClaw session
#
# Usage: clawd-notify "your message here"
#

set -e

# Check if message is provided
if [ -z "$1" ]; then
    echo "Usage: clawd-notify \"<message>\""
    exit 1
fi

MESSAGE="$1"

# Send message to main session
echo "Sending message to main session..."
openclaw sessions_send --message "$MESSAGE"

echo "Message sent successfully!"
