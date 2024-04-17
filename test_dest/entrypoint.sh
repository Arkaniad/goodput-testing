#!/usr/bin/env bash
# 1400ms
SIMULATED_LATENCY="${SIMULATED_LATENCY:-1400}"

# 2 megabit
SIMULATED_BANDWIDTH="${SIMULATED_BANDWIDTH:-2.0}"

# 50% packet loss
SIMULATED_LOSS="${SIMULATED_LOSS:-50.0}"

device="eth0"

# divide latency by half and assign that half to each side of the test
our_latency=$((SIMULATED_LATENCY / 2))

tc qdisc add dev "$device" root netem latency "${our_latency}ms" rate "${SIMULATED_BANDWIDTH}mbit" loss random "$SIMULATED_LOSS"
iperf -s -B "0.0.0.0"
