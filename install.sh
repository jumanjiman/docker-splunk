#!/bin/bash

# Ensure disired ownership.
cd /opt
chown -R splunk:splunk /splunk

# Start splunk and accept the free license
cd /opt/splunk/bin
./splunk start --accept-license
