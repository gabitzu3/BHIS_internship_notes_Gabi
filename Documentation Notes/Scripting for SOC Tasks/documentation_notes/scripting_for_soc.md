
# Scripting for SOC Tasks notes/overview

- Automate repetitive tasks

- analyze logs and events

---

## 1. Basic Python Scripting

### Key Concepts

#### Parsing Simple Logs (CSV & JSON)

**CSV (Comma-Separated Values)** logs:
- Common for exported logs from SIEMs (e.g., Splunk, ELK)
- Handled using Python’s built-in `csv` module

```python
import csv

with open("EXAMPLE.csv") as file:
    reader = csv.DictReader(file)
    for row in reader:
        print(row["event_type"])
```

**JSON (JavaScript Object Notation)** logs:
- Widely used in modern APIs and log formats (e.g., Sysmon, firewall logs)
- Handled with Python’s `json` module

```python
import json

with open("EXAMPLE.json") as file:
    data = json.load(file)
    for entry in data:
        print(entry["username"])
```

#### Python libraries learned

- `requests`: For making HTTP requests to APIs (ex: VirusTotal)
- `json`: for working with structured data from logs or API responses
- `re`: regular expressions module for searching log patterns

##### Why `requests`?
- Automates querying threat intelligence platforms like AbuseIPDB or VirusTotal
- Used to send and retrieve data via HTTP(S)

##### Why `json`?
- Most APIs return JSON responses
- Essential for parsing returned data like threat scores or verdicts

##### Why `re`?
- Extracts specific data (ex: IPs, usernames, hashes) from raw text logs

Example pattern:
```python
import re

log = "Failed login from 192.168.1.5"
match = re.search(r"(\d{1,3}\.){3}\d{1,3}", log)
if match:
    print("IP Address found:", match.group())
```

---

## 2. Basic PowerShell Scripting

PowerShell is a powerful command-line and scripting tool, especially useful for Windows environments

### Key Concepts

#### System Information Gathering

Common PowerShell commands:

```powershell
Get-ComputerInfo      # General system info
Get-Process           # Active processes
Get-Service           # Services running on the system
Get-LocalUser         # Local user accounts
```

These can be combined into scripts to automate host profiling during incidents.

#### Log Collection

PowerShell can collect and export logs from Windows Event Viewer — particularly useful for tracking failed logins or other suspicious behavior.

Example: Exporting failed login attempts (Event ID 4625):

```powershell
Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4625 } | Export-Csv failed_logins.csv
```

Explanation:
- it filters Windows Security logs for failed logins
- after that, it outputs results to a CSV file for further analysis

---

I also worked on basic scripting skills and I made 2 scripts:

- The first script is [failed_logins_extractor.py](./../personal_scripts/failed_logins_extractor.py). It works only if the specified parameters are changed to the actual row names.

- The second script is [AbuseIPDB.py](./../personal_scripts/AbuseIPDB.py). I tried it and it works perfectly, as you can see in the screenshot below. The only thing that needs to be changed is the API.

![ip script test](https://i.ibb.co/Qv7PGf51/Screenshot-2025-07-17-174359.png)

---

resources:

- https://github.com/sbousseaden/EVTX-ATTACK-SAMPLES
- https://www.abuseipdb.com/api.html
- https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/    -very useful encyclopedia
- https://regexone.com/ -great exercises I used to learn Regex
- https://gto76.github.io/python-cheatsheet/ -another cheatsheet I used
- https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started  -this is what I used for learning a few powershell commands
- https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.5
