# RITA v5: CTF Questions



## slow\_steady\_beacon

**Dataset:** Cobalt Strike — HTTP, Delay 30s, Jitter 0

1. Which internal host IP is beaconing?

**Answer:** 192.168.2.77

2. What external IP is being contacted?

**Answer:** 143.198.3.13


4. What protocol and port are used?

**Answer:** HTTP (tcp 80)

5. What is the beacon score?

**Answer:** 1.0

6. What is the connection count?

**Answer:** 2853

---

## beacon_jitter

**Dataset:** Cobalt Strike — HTTP, Delay 30s, Jitter 25%

1. Which internal host IP is contacting the FQDN?

**Answer:** 192.168.2.77

2. What FQDN is being contacted?

**Answer:** timeserversync.com


4. What protocol and port are used?

**Answer:** HTTP (tcp 80)

5. What is the beacon score?

**Answer:** 0.99

6. What is the connection count?

**Answer:** 3283

---

## icedid

**Dataset:** Cobalt Strike-like and long connections — Delay 300s, Jitter 99, HTTP 8080

1. Which internal host IP appears in this dataset?

**Answer:** 192.168.2.77

2. Primary external IP\:port (Cobalt Strike-like)?

**Answer:** 143.198.3.13:8080

3. What is the beacon score for that entry?

**Answer:** 0.859

4. Name one long-connection external IP observed.

**Answer:** 147.75.62.184(can be multiple answers)



---

## randomized\_redirectors

**Dataset:** Cobalt Strike via multiple redirectors — Delay 5s, Jitter 50%

1. Which internal host IP uses multiple redirectors?

**Answer:** 192.168.2.77

2. Redirector FQDN #1?

**Answer:** timeserversync.com

3. Redirector FQDN #2?

**Answer:** weathersync.cloud



5. Beacon score to redirector #1?

**Answer:** 0.949

6. Total connection count (for redirector 1)?

**Answer:** 10914

7. Protocol and port used?

**Answer:** HTTP (tcp 80)

---

## teamviewer

**Dataset:** TeamViewer — Egress via TCP 443


1. Which internal host is flagged Critical for TeamViewer activity in teamviewer_view.csv

**Answer:** 192.168.99.52
 
2. How many connections are recorded for the Critical TeamViewer entry

**Answer:** 51
 
3. How many total kilobytes are reported for the Critical TeamViewer entry

**Answer:** 875.5
 
4. What is the exact Port:Proto:Service string for the Critical TeamViewer entry

**Answer:** 443:tcp:ssl
 
5. RITA also shows a High-severity flow from the same host to a public IP over TeamViewer’s well-known port with a 0% beacon score. What destination IP and port are used in that entry

**Answer:** 52.117.209.74:5938
 
6. How many total megabytes moved over that TeamViewer port (from Q5) in that single entry

**Answer:** 796.2