#!/usr/bin/env bash

# 1400ms
SIMULATED_LATENCY="${SIMULATED_LATENCY:-1400}"

# 2 megabit
SIMULATED_BANDWIDTH="${SIMULATED_BANDWIDTH:-2.0}"

# 50% packet loss
SIMULATED_LOSS="${SIMULATED_LOSS:-50.0}"

SIMULATED_DURATION="${SIMULATED_DURATION:-30}"

device="eth0"

our_latency=$((SIMULATED_LATENCY / 2))

# Adjust the local network interface accordingly using netem
tc qdisc add dev "$device" root netem latency "${our_latency}ms" rate "${SIMULATED_BANDWIDTH}mbit" loss random "$SIMULATED_LOSS"

# Build a report name
report_date="$(date "+%m%d%H%M%Y.%S")"
report_name="test_${SIMULATED_BANDWIDTH}mbit_${SIMULATED_LATENCY}ms_${SIMULATED_LOSS}loss_${report_date}.log"

sleep 3
iperf -c test_dest -t "$SIMULATED_DURATION" -Z cubic
