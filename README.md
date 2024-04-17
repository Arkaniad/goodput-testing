# Overview

## Test a bandwidth scenario

``` bash
./test-bandwidth-scenario.sh 2.0 1400 50.0  
```

This runs the test containers with the following:

- 2.0mbps total bandwidth cap on each end
- 1400ms total round trip latency (divided by two, 700ms for client and 700ms for server)
- 50.0% packet loss on each end

The output will look like this:

```
[+] Running 2/0
 ✔ Container goodput-testing-test_dest-1  Created                                                                                                                              0.0s 
 ✔ Container goodput-testing-test_src-1   Created                                                                                                                              0.0s 
Attaching to goodput-testing-test_dest-1, goodput-testing-test_src-1
goodput-testing-test_dest-1  | ------------------------------------------------------------
goodput-testing-test_dest-1  | Server listening on TCP port 5001
goodput-testing-test_dest-1  | TCP window size:  128 KByte (default)
goodput-testing-test_dest-1  | ------------------------------------------------------------
goodput-testing-test_src-1   | ------------------------------------------------------------
goodput-testing-test_src-1   | Client connecting to test_dest, TCP port 5001
goodput-testing-test_src-1   | TCP congestion control set to cubic
goodput-testing-test_src-1   | TCP window size: 16.0 KByte (default)
goodput-testing-test_src-1   | ------------------------------------------------------------
goodput-testing-test_src-1   | [  1] local 192.168.160.3 port 59668 connected with 192.168.160.2 port 5001
goodput-testing-test_dest-1  | [  1] local 192.168.160.2 port 5001 connected with 192.168.160.3 port 59668
goodput-testing-test_src-1   | [ ID] Interval       Transfer     Bandwidth
goodput-testing-test_src-1   | [  1] 0.00-60.50 sec  46.7 KBytes  6.33 Kbits/sec
goodput-testing-test_src-1 exited with code 0
Aborting on container exit...
[+] Stopping 2/2
 ✔ Container goodput-testing-test_src-1   Stopped                                                                                                                              0.0s 
 ✔ Container goodput-testing-test_dest-1  Stopped   
```

The results you seek are here:

```
goodput-testing-test_src-1   | [ ID] Interval       Transfer     Bandwidth
goodput-testing-test_src-1   | [  1] 0.00-60.50 sec  46.7 KBytes  6.33 Kbits/sec
```

If you want to adjust the duration of the test, you can add an additional argument for duration in seconds (default 30)

``` bash
./test-bandwidth-scenario.sh 2.0 1400 50.0 60
```

Same as above, but for 60 seconds rather than 30

# Troubleshooting
