#!/bin/sh
set -e

# Start the LanguageTool server
JAVA_OPTS="-Xms256m -Xmx512m"
SERVER_JAR="languagetool-server.jar"

# Railway assigns a PORT environment variable automatically
# If PORT is not set, default to 10000
PORT="${PORT:-10000}"

echo "Starting LanguageTool server on port $PORT"
exec java $JAVA_OPTS -cp "$SERVER_JAR" org.languagetool.server.HTTPServer --port "$PORT" --public --allow-origin '*'
