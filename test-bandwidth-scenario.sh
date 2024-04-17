#!/usr/bin/env bash

# example run:
# ./test-bandwidth-scenario 2.0 1400 50.0
# 2.0mbps bandwidth cap
# 1400ms latency (divided by two, 700ms for source and 700ms for destination)
# 50.0% packet loss bidirectional

bandwidth="$1"
latency="$2"
loss="$3"
# default duration of 30s
test_duration="${4:-30}"

export SIMULATED_BANDWIDTH="$bandwidth"
export SIMULATED_LATENCY="$latency"
export SIMULATED_LOSS="$loss"
export SIMULATED_DURATION="$test_duration"

echo "Running simulation: ${SIMULATED_BANDWIDTH}mbit/s, ${SIMULATED_LATENCY}ms total round trip latency, ${SIMULATED_LOSS}% packet loss for ${SIMULATED_DURATION} seconds"

docker compose up --build --abort-on-container-exit --remove-orphans
