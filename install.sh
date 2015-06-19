#!/bin/bash

# Ensure disired ownership.
# chown -R splunk:splunk /opt/splunk

# Start splunk and accept the free license
/opt/splunk/bin ./splunk start --accept-license
