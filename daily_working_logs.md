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
