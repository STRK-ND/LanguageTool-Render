# Use Amazon Corretto 17 Alpine as the base image
FROM amazoncorretto:17-alpine

# Set the LanguageTool version and port
ENV VERSION=6.0 \
    PORT=10000

# Install unzip
RUN apk add --no-cache unzip

# Download and extract LanguageTool
RUN wget https://languagetool.org/download/LanguageTool-${VERSION}.zip && \
    unzip LanguageTool-${VERSION}.zip && \
    rm LanguageTool-${VERSION}.zip

# Set working directory
WORKDIR /LanguageTool-${VERSION}

# Copy the startup script
COPY languagetool.sh /languagetool.sh
RUN chmod +x /languagetool.sh

# Run as non-root user
USER nobody

# Expose the port
EXPOSE ${PORT}

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT}/v2/check || exit 1

# Set the entrypoint
ENTRYPOINT ["/languagetool.sh"]
