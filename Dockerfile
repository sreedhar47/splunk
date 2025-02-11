# Use the official Splunk image as the base image
FROM splunk/splunk:latest

# Accept the license
ENV SPLUNK_START_ARGS="--accept-license"

# Set the admin password
ENV SPLUNK_PASSWORD=yourpassword

# Expose Splunk Web Interface
EXPOSE 8000

# Optionally, copy your custom Splunk configuration files into the container
# COPY /path/to/your/local/splunk/configs /opt/splunk/etc/system/local/

# Start Splunk
CMD ["/opt/splunk/bin/splunk", "start", "--accept-license", "--no-prompt"]
