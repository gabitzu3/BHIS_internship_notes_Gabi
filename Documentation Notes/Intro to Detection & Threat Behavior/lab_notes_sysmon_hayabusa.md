# Lab Notes

## Overview

During this lab/project, several problems were encountered while attempting to run PowerShell commands and dump the `lsass.exe` process memory. These issues were identified, debugged, and resolved where possible. After stabilizing the environment, I simulated two MITRE ATT&CK techniques and used Hayabusa to export and analyze the results.

---

## PowerShell Command Troubleshooting

### Problem: Empty `-EncodedCommand`

Attempted command:

```powershell
powershell.exe -EncodedCommand aQBlAHgA
```

Error output:

```
Invoke-Expression : Cannot bind argument to parameter 'Command' because it is an empty string.
```

**Cause:**  
The Base64-encoded command `aQBlAHgA` decodes to `iex`, which by itself doesn't include an actual command to run.

---

### Problem: Malformed Base64 Encoding

Attempted command:

```powershell
powershell.exe -EncodedCommand UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAG4AbwB0AGUAcABhAGQAA==
```

Error output:

```
Cannot process the command because the value specified with -EncodedCommand is not properly encoded.
```

**Cause:**  
The encoded string was invalid — likely due to incorrect padding or encoding.

---

### Correct Workflow for Encoded Commands

Example workflow:

```powershell
$command = 'Start-Process notepad'
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
[Convert]::ToBase64String($bytes)
```

Resulting Base64 output:

```
UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAG4AbwB0AGUAcABhAGQA
```

Tried running:

```powershell
powershell.exe -EncodedCommand UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAG4AbwB0AGUAcABhAGQ=
```

This failed due to a typo in the command (`notepa`).

---

### Final Working Example

```powershell
$command = 'Start-Process notepad.exe'
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
$encoded = [Convert]::ToBase64String($bytes)
powershell.exe -EncodedCommand $encoded
```

Resulting Base64 string:

```
UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAG4AbwB0AGUAcABhAGQALgBlAHgAZQA=
```

Execution:

```powershell
powershell.exe -EncodedCommand UwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAG4AbwB0AGUAcABhAGQALgBlAHgAZQA=
```

This successfully opened Notepad.

---

## Failed Attempt to Dump LSASS Memory

Attempted command:

```powershell
procdump.exe -ma lsass.exe lsass.dmp
```

Error:

```
procdump.exe : The term 'procdump.exe' is not recognized as the name of a cmdlet, function, script file, or operable program.
```

**Cause:**  
`procdump.exe` was not installed or not available in the system's PATH.

---

## Sysmon Reinstallation

To restore proper event logging, I uninstalled and reinstalled Sysmon using a GitHub config:

```powershell
Sysmon64.exe -accepteula -i sysmonconfig-export.xml
```

---

## Simulated ATT&CK Techniques

Two MITRE ATT&CK techniques were simulated as part of this lab.  


---

## Log Analysis with Hayabusa

After simulating the attacks, I used **Hayabusa** to analyze the logs:

- **Exported Windows Event Logs**
- **Parsed the data for indicators of malicious activity**

Hayabusa helped validate that Sysmon was correctly logging relevant events post-configuration.

---

links and sources:
https://github.com/SwiftOnSecurity/sysmon-config
https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon
https://learn.microsoft.com/en-us/sysinternals/downloads/procdump
https://github.com/Yamato-Security/hayabusa
https://www.microsoft.com/en-ca/software-download/windows10
https://www.virtualbox.org/
