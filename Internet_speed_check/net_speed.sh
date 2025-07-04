#!/bin/bash

# Internet Speed Check Script Abhiyander
# Author: Abhiyander
# Version: 1.0

echo "Checking your internet speed... Please wait."

# Check speedtest-cli
if ! command -v speedtest-cli &> /dev/null
then
    echo "speedtest-cli is not installed."
    echo "Run: pip install speedtest-cli"
    exit 1
fi

# test
speedtest-cli --simple | tee speedtest_result.txt


echo -e "\n🔍 Summary:"
DOWNLOAD=$(grep "Download" speedtest_result.txt | awk '{print $2, $3}')
UPLOAD=$(grep "Upload" speedtest_result.txt | awk '{print $2, $3}')
PING=$(grep "Ping" speedtest_result.txt | awk '{print $2, $3}')

echo "🌐 Ping: $PING"
echo "⬇️ Download Speed: $DOWNLOAD"
echo "⬆️ Upload Speed: $UPLOAD"

# Clean up
rm speedtest_result.txt
