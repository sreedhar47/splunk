# Use the official Splunk image as the base image
FROM splunk/splunk:latest

# Accept the license through environment variable (will be set in Render)
ENV SPLUNK_START_ARGS="--accept-license"

# Set the admin password (set via Render environment variable)
# Avoid hardcoding password in Dockerfile. It's better to set it in Render.
ARG SPLUNK_PASSWORD
ENV SPLUNK_PASSWORD=${SPLUNK_PASSWORD}

# Expose the necessary ports
EXPOSE 8000 8089 9997

# Optionally, copy custom Splunk configuration files into the container (if any)
# COPY /path/to/your/local/splunk/configs /opt/splunk/etc/system/local/

# Start Splunk with the environment variables
CMD ["/opt/splunk/bin/splunk", "start", "--accept-license", "--no-prompt", "--seed-passwd", "$SPLUNK_PASSWORD"]
