# Zeek Docker Setup and Troubleshooting

Unfortunately, I was unable to install Zeek. I tried multiple methods, even using Docker and debugged errors for several hours. After I got it running, I encountered another problem—it wasn't creating logs, so it wasn't working. So unfortunately, I was unable to set up a lab with Zeek.

## 1. **Initial Attempt to Run Zeek Container**
   - **Command:**
     ```bash
     docker run --rm -it --net=host zeek/zeek zeek -i eth0
     ```
   - **Error:**
     ```text
     docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied.
     ```

---

## 2. **Attempt with `sudo`**
   - **Command:**
     ```bash
     sudo docker run --rm -it --net=host zeek/zeek zeek -i eth0
     ```
   - **Image Pull:**
     Since the Zeek image `zeek/zeek:latest` wasn't available locally, Docker pulled it from the repository:
     ```text
     Unable to find image 'zeek/zeek:latest' locally
     latest: Pulling from zeek/zeek
     ...
     ```
   - **Warning:**
     Zeek printed a warning about invalid TCP checksums due to NIC checksum offloading:
     ```text
     warning in /usr/local/zeek/share/zeek/base/misc/find-checksum-offloading.zeek, line 54: 
     Your interface is likely receiving invalid TCP checksums, most likely from NIC checksum offloading. 
     By default, packets with invalid checksums are discarded by Zeek unless using the -C command-line option or toggling the 'ignore_checksums' variable. 
     Alternatively, disable checksum offloading by the network adapter to ensure Zeek analyzes the actual checksums that are transmitted.
     ```
   - **Termination Signal:**
     I manually interrupted Zeek with `Ctrl + C`. Zeek processed 1,768 packets with no drops or unprocessed packets:
     ```text
     1753192554.271936 received termination signal
     1753192554.271936 1768 packets received on interface eth0, 0 (0.00%) dropped, 0 (0.00%) not processed
     ```

---

## 3. **Disabling Checksum Offloading**
   - **Command to disable checksum offloading:**
     ```bash
     sudo ethtool -K eth0 tx off rx off
     ```
   - **Actual Changes:**
     ```text
     Actual changes:
     tx-checksum-ip-generic: off
     tx-tcp-segmentation: off [not requested]
     ```

---

## 4. **Running Zeek with Checksum Validation Disabled (`-C` flag)**
   - **Command:**
     ```bash
     sudo docker run --rm -it --net=host zeek/zeek zeek -C -i eth0
     ```
   - **Result:**
     Zeek successfully started on `eth0` with checksum validation disabled. I manually interrupted the process again with `Ctrl + C`, and Zeek reported processing 196 packets:
     ```text
     1753192645.647447 received termination signal
     1753192645.647447 196 packets received on interface eth0, 0 (0.00%) dropped, 0 (0.00%) not processed
     ```

---

## 5. **Running Zeek with PCAP Files**

### 5.1 **Attempt with Exercise PCAP File**
   - **Command:**
     ```bash
     sudo docker run --rm -it -v ~/Downloads:/mnt/Downloads zeek/zeek zeek -r /mnt/Downloads/exercise.pcap
     ```
   - **Result:**
     No issues were encountered during this command. Zeek started analyzing the `exercise.pcap` file located in the `Downloads` directory, mounted to `/mnt/Downloads`.

### 5.2 **Attempt with Exercise PCAP File and Logs**
   - **Command:**
     ```bash
     sudo docker run --rm -it -v ~/Downloads:/mnt/Downloads -v ~/Downloads/zeek_logs:/usr/local/zeek/logs zeek/zeek zeek -r /mnt/Downloads/exercise.pcap
     ```
   - **Result:**
     This command mounted an additional volume to store Zeek logs (`~/Downloads/zeek_logs`) and passed the `exercise.pcap` file for analysis. Zeek processed the file.

### 5.3 **Attempt with Debug and Verbose Output**
   - **Command:**
     ```bash
     sudo docker run --rm -it -v ~/Downloads:/mnt/Downloads -v ~/Downloads/zeek_logs:/usr/local/zeek/logs zeek/zeek zeek -d -v -r /mnt/Downloads/exercise.pcap
     ```


---

## 6. **Verifying Zeek Version**
   - **Command:**
     ```bash
     sudo docker run --rm -it zeek/zeek zeek --version
     ```
   - **Result:**
     The version of Zeek was successfully retrieved, showing:
     ```text
     zeek version 7.2.2
     ```

---

## 7. **Error with Missing PCAP File (`sample.pcap`)**
   - **Command:**
     ```bash
     sudo docker run --rm -it -v ~/Downloads:/mnt/Downloads -v ~/Downloads/zeek_logs:/usr/local/zeek/logs zeek/zeek zeek -r /mnt/Downloads/sample.pcap
     ```
   - **Error:**
     ```text
     fatal error: problem with trace file /mnt/Downloads/sample.pcap (unable to open /mnt/Downloads/sample.pcap: No such file or directory)
     ```


---

## 8. **Accessing Zeek Container to Debug**
   - **Command:**
     ```bash
     sudo docker run --rm -it -v ~/Downloads:/mnt/Downloads -v ~/Downloads/zeek_logs:/usr/local/zeek/logs zeek/zeek /bin/bash
     ```
   - **Inside the Container:**
     Once inside the container, I ran the following command to debug:
     ```bash
     zeek -d -v -r /mnt/Downloads/exercise.pcap
     ```
     Zeek processed the `exercise.pcap` file in debug and verbose mode successfully.

   - **Checking Logs:**
     I listed the Zeek logs directory to ensure logs were generated:
     ```bash
     ls /usr/local/zeek/logs
     ```
 Unfortunately it still didn't work, no log was created 

---

## Summary of Issues and Solutions:
- **Permission Issue** 
- **Checksum Warning** Zeek warned about invalid TCP checksums caused by NIC checksum offloading, which was resolved by either disabling checksum offloading on the NIC or using the `-C` flag to ignore checksum validation.
- **Missing PCAP File** The `sample.pcap` file wasn't found because it did not exist in the mounted directory.
- **Solution to Checksum Issue** I disabled checksum offloading using `ethtool` and ran Zeek with the `-C` flag to ignore checksum errors.
- **Accessing Zeek Logs** Mounted the `zeek_logs` directory to ensure logs were stored and viewed after analysis.

and many more Issues