# Daily Activity Log

## Overview
This document outlines the daily tasks and learning activities undertaken as part of my journey

---

## 3.Detection & Threat Behavior


###  15.07.2025  
 **Total Time Spent:** 3 hours and 10 minutes (13:20–16:31)  
 *Excluding meetings*

#### Activities:
- Started learning about the MITRE ATT&CK framework and began taking structured notes.
- Worked on documentation related to MITRE ATT&CK.
- Started initial note-taking on **Hayabusa**.

---

###  16.07.2025  
 **Total Time Spent:** 6 hours and 25 minutes (14:00–21:04)  
 *Breaks: -5 minutes (toilet), -30 minutes (dinner)*

#### Activities:
- Created a new GitHub repository to store and organize Internship Notes.
- Added previous notes from 15.07.2025 into the repository.
- Set up a new **Windows 10 Virtual Machine** for lab purposes.
- Worked on a lab releted to MITRE ATT&CK
- Downloaded and installed **Hayabusa** in the VM.
- Practiced basic Hayabusa commands:
- Simulated a basic attack inside the VM.
- Performed forensic analysis using Hayabusa to detect the simulated behavior.
- Cleaned the VM a little bit.
---


## 4.Scripting for SOC Tasks


### 17.07.2025
**Total Time Spent:** 6 hours (14:02-20:14)
*Breaks: -10 minutes (2x toilet)*

#### Activities:

- Studied the 4th section: "Scripting for SOC Tasks" topics and I gathered resources about PowerShell
- I summarized all the good and useful information/commands inside [powershell_for_soc.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/powershell_for_soc.md) and also [scripting_for_soc.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/scripting_for_soc.md)
- I learned how to use regex for log parsing, powerShell system info and log export commands
- I made the first recommended project, the one that extracts failed logins from a log file [failed_logins_extractor.py](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/failed_logins_extractor.py)
- I Finished the first lab from this section [lab1_detect_brute_force.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/labs/lab1_detect_brute_force.md) and also its solution: [lab1_solution_step_by_step.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/labs/lab1_solution_step_by_step.md)
---


### 18.07.2025
**Total Time Spent:** 6 hours and 25 minutes (13:29-18:00  19:30-21:51)
*Breaks: -5 minutes (toilet), -20 minutes (lunch)*


#### Activities:
- finished [powershell_for_soc.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/powershell_for_soc.md) and also [scripting_for_soc.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/scripting_for_soc.md) summaries by adding what I learned today.
- I made the second recommended project, the one with public threat intel API [AbuseIPDB.py](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/AbuseIPDB.py)
- I updated the lab from the Intro to Detection & Threat Behavior section (the one with sysmon and hayabusa) and I added some photos. I encountered some problems with the lab, but it turned out to be just the windows defender.
- I also permanently disabled Windows Update from the lab(or at least I think so)
- I Finished the second lab from this section [lab2_collect_system_info.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/labs/lab2_collect_system_info.md) and also its solution: [lab2_solution_step_by_step.md](./Documentation%20Notes/Scripting%20for%20SOC%20Tasks/labs/lab2_solution_steb_by_step.md)

---

## 5.Networking & Telemetry 101

### 21.07.2025
**Total Time Spent:** 5 hours and 15 minutes (14:00-20:21)
*Breaks: -1 hour (dinner), -5 minutes (toilet)*

#### Activities:


- Set up the new laptop, installed the OS, and configured everything, including email and security settings.

- Transferred files from my main laptop and organized them for easy access.

- Started setting up VMs and lab environment(I left them transfering overnight)

- Started the "Networking & Telemetry 101" section. Gathered resources, took detailed notes on network ports, network logs, and the differences between NetFlow vs. full packet capture.

- Combined this with my own knowledge to create a solid reference.

- Began putting together a note file explaining the Wireshark interface. Focused on key features and shortcuts, breaking down the tools for easier network analysis.

- I worked on tcpdump documentation and finished it

---

### 22.07.2025
**Total Time Spent:** 5 hours and 20 minutes (14:10-19:41)
*Breaks: - 10 minutes (toilet x2)*

#### Activities:

- Moved labs/VMs to laptop: Since the labs were quite big, I transferred them via peer-to-peer and it took some time so they finished moving overnight 

- Wireshark documentation:finished the documentation and added photos; 

- Zeek setup and Docker issues: Ran into issues with Zeek and Docker, spent a few hours debugging and testing to fix them.(but I couldn't fix anything)

- I worked on Zeek documentation and finished it, even if I couldn't run Zeek 

- Annual Security Training: Watched the training.(only watched yet)

---

### 23.07.2025
**Total Time Spent:** 4 hours and 25 minutes (14:22-18:55)
*Breaks: -5 minutes (toilet)*

#### Activities:

- worked on a wireshark lab, I tried to create a custom pcap file for 2 hours but I couldn't get what I wanted so I searched on Google for random pcaps and I found one. So tomorrow I will try to create some questions and finish the actual lab.

- completed CJ Cox's checklist(Annual Security Training)

- I've set a new Kali Linux lab to learn Snort and Suricata

- Installed Snort but I didn't have much time today to learn anything

---

### 24.07.2025
**Total Time Spent:** 5 hours (14:01-20:32)
*Breaks: -30 minutes (recreative break), -1 hour (dinner)*

#### Activities:

- researched LDAP Protocol

- finished the [Wireshark LDAP lab](./Documentation%20Notes/Networking%20&%20Telemetry%20101/labs/wireshark_ldap_lab.md)... FINALY :)

- finished the [step-by-step solution](./Documentation%20Notes/Networking%20&%20Telemetry%20101/labs/wireshark_ldap_lab_solution.md) // It was the longest lab I've ever worked on

- started researching Snort but not so much time to practically explore it, only some documentation from the web and a few notes. I'll play with it tomorrow and think for a lab idea.

---

### 25.07.2025
**Total Time Spent:** 6 hours (14:13-20:25)
*Breaks: -10 minutes (toilet x2)*

#### Activities:

- Spent time exploring and experimenting with Snort; completed initial research and testing (and also the notes documentation for the tool)

- Also spent time exploring and playing with Suricata. Finished the documentation for this tool too

- Started working on a new [IDS lab](./Documentation%20Notes/Networking%20&%20Telemetry%20101/labs/ids_lab) and finished it surprisingly today

- Finished section 5:"Networking & Telemetry 101" and also finished the tools documentation releted to this section

- Updated the colaborative repository with a part of my work.

---

## 8.Email Fundamentals

### 28.07.2025
**Total Time Spent:** 5 hours and 30 minutes (14:01-19:40)
*Breaks: -5 minutes (toilet)*

- Starting working on the section `8.Email Fundamentals`

- Finished the [phishing email documentation](./Documentation%20Notes/Email%20Fundamentals/email_fundamentals.md)

- Starting working on a [email lab](./Documentation%20Notes/Email%20Fundamentals/phishing_email_lab.md)

- Finished the [email lab](./Documentation%20Notes/Email%20Fundamentals/phishing_email_lab.md) and also the [email lab solution](./Documentation%20Notes/Email%20Fundamentals/phishing_email_lab_solution.md)

---

### 29.07.2025 (1 hour and 30 minutes) (2 hours and 40 minutes // n)

8:00-9:30

- finished the work/course in the colab repo

10:00-11:00

14:20-15:00

- ctf ace-t

---

### 30.07.2025 (2 hours and 30 minutes // n)

09:00-11:30-ctf ace-t and started the adhd course

---

### 31.07.2025 (2 hours and 30 minutes // n) (1 hour and 40 minutes)

9:30-12:00 
21:19-23:00

- ctf ace-t

- Updating labs for the cloud VM




### 01.08.2025 (1 hour and 20 minutes)

11:00-12:20

- Updating labs

---

### 04.08.2025 (1 hour and 10 minutes // n) (4 hours and 5 minutes)

14:30-15:40
16:20-18:15
19:00-21:10

- ace-t ctf

- starting building the ubuntu vm

- debugging suricata, keep getting these errors and cannot solve them("sudo suricata -c /etc/suricata/suricata.yaml -i lo
i: suricata: This is Suricata version 7.0.3 RELEASE running in SYSTEM mode
W: ioctl: lo: failed to set SIOCETHTOOL ioctl: Operation not supported
E: af-packet: lo: Frame size bigger than block size
E: af-packet: lo: ring parameters are incorrect. Please file a bug report
E: af-packet: lo: failed to init socket for interface
E: threads: thread "W#01-lo" failed to start: flags 0423")

---

### 05.08.2025(4 hours and 40 minutes)

17:10-19:50 

20:00-22:00


- finished the ubuntu vm

- made a list with everything that was installed by me and Alex

- edited labs

- updated my labs and also Alex's labs with Tim's requierments

---

### 06.08.2025 (5 hours and 45 minutes)

14:30-17:15  

17:45-20:45

- updated Labs

- added photos to the ids lab

- updated GitHub pages

- searched for .eml files

- I also set up an ubuntu vm for the memory dump

- moving the Lima Charlie lab from https://github.com/strandjs/IntroLabs/blob/master/IntroClassFiles/Tools/IntroClass/limacharlie/limacharlie.md

---

### 07.08.2025 (7 hours and 35 minutes)

14:00-15:40

16:15-22:20

> -10 minutes(2 toilet breaks)

- worked on the .eml files in the email section

- created some ctf questions for the email files

- presented a live demo of all the labs

- Added photos to the ctf writeups

- Finished all 8 .eml files and ctf questions!

- Updated the colab repo

---

### 08.08.2025 (4 hours and 15 minutes)

14:01-15:13 (1 hour and 10 minutes)

17:00-20:05 (3 hours and 5 minutes)

- update course navigation

- wifi Forge?(didn't really understand what to do)

- debugged zeek ,FINALY MADE IT RUN using this method:

```
sudo apt install cmake make gcc g++ flex bison libpcap-dev libssl-dev python3-dev swig zlib1g-dev
git clone https://github.com/zeek/zeek
cd zeek
cd /home/kali/Downloads/zeek && git submodule update --recursive --init
./configure
sudo apt install libzmq3-dev libczmq-dev
sudo apt install libnode-dev
make distclean || rm -rf build
git submodule update --init --recursive
./configure
make -j$(nproc)
sudo make install
export PATH=/usr/local/zeek/bin:$PATH
```

- updated all the course sections with Tim's requirements // the whole repo

- researched and learned more about Zeek

---

### 11.08.2025 (6 hours and 25 minutes)

11:01-17:27


- Zeek still made a lot of errors since it was a dev version, so I switched to ubuntu

- installed it using:

```bash
echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_25.04/ /' | sudo tee /etc/apt/sources.list.d/security:zeek.list
curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_25.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null
sudo apt update
sudo rm /etc/apt/trusted.gpg.d/security_zeek.gpg
sudo rm /etc/apt/sources.list.d/security_zeek.list 2>/dev/null
curl -fsSL https://download.opensuse.org/repositories/security:zeek/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null
echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_24.04/ /' | sudo tee /etc/apt/sources.list.d/security_zeek.list
sudo apt update
whereis zeek
nano ~/.bashrc
source ~/.bashrc
```

and only after these, zeek finaly worked:
```bash
user@ubuntuVM:~$ zeek -v
zeek version 7.2.2
```

- learned zeek more

- worked on lab documentation

- finished the zeek lab/mini-solution(results)

