#!/bin/sh
set -e

# Start the LanguageTool server
JAVA_OPTS="-Xms256m -Xmx512m"
SERVER_JAR="languagetool-server.jar"

exec java $JAVA_OPTS -cp "$SERVER_JAR" org.languagetool.server.HTTPServer --port "$PORT" --public --allow-origin '*'
