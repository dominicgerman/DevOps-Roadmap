#!/bin/bash

# This script generates CPU, memory, disk I/O, and network load for testing monitoring dashboards.

echo "Starting system load tests..."

# Function to clean up processes on exit
cleanup() {
    echo "Stopping stress processes..."
    pkill -f "stress" || echo "No stress processes to kill."
    pkill -f "iperf3" || echo "No iperf3 processes to kill."
    echo "Cleanup complete."
}

# Trap exit signals to ensure cleanup
trap cleanup EXIT

# CPU Load
echo "Generating CPU load..."
stress --cpu 4 --timeout 60 &

# Memory Load
echo "Generating memory load..."
stress --vm 2 --vm-bytes 512M --timeout 60 &

# Disk I/O Load
echo "Generating disk I/O load..."
dd if=/dev/zero of=/tmp/testfile bs=1M count=1024 oflag=direct &

# Network Load
echo "Generating network load..."
iperf3 -s > /dev/null 2>&1 &  # Start iperf3 server
sleep 1  # Allow server to start
iperf3 -c 127.0.0.1 -t 60 > /dev/null 2>&1 &  # Run iperf3 client

# Wait for stress tests to complete
wait

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -f /tmp/testfile

echo "System load tests completed."

