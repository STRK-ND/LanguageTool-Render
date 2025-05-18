#!/bin/sh
set -e

# Start the LanguageTool server
# Use more conservative memory settings for Railway
JAVA_OPTS="-Xms128m -Xmx384m -XX:+UseG1GC -XX:+UseStringDeduplication"
SERVER_JAR="languagetool-server.jar"

# Railway assigns a PORT environment variable automatically
# If PORT is not set, default to 10000
PORT="${PORT:-10000}"

echo "Starting LanguageTool server on port $PORT with optimized settings for Railway"
exec java $JAVA_OPTS -cp "$SERVER_JAR" org.languagetool.server.HTTPServer --port "$PORT" --public --allow-origin '*' --maxCheckTimeMillis 5000 --maxTextLength 10000
