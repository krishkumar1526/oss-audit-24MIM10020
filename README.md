# oss-audit-24MIM10020
# Open Source Audit Project

## Student Information

| Field | Details |
|-------|---------|
| **Name** | KRISH |
| **Roll Number** | 24MIM10020 |
| **Chosen Software** | Python (Programming Language) |
| **Course** | Open Source Software |
| **Project Title** | The Open Source Audit |

---

## Project Overview

This project is a comprehensive open-source audit of Python, one of the most influential open-source programming languages in the world. The audit covers:

- **Origin Story**: Why Python was created and why it was released as open source
- **License Analysis**: Deep dive into the Python Software Foundation (PSF) License
- **Ethical Reflection**: Philosophical questions about open source software
- **Linux Footprint**: How Python lives and operates on a Linux system
- **Ecosystem**: Dependencies, communities, and governance of Python
- **Comparative Analysis**: Python vs proprietary alternatives

---

## Scripts Included

This repository contains 5 shell scripts that demonstrate practical Linux automation skills:

| Script | Description | Usage |
|--------|-------------|-------|
| `script1.sh` | **System Identity Report** - Displays Linux distribution, kernel version, current user, home directory, system uptime, and current date/time | `./script1.sh` |
| `script2.sh` | **FOSS Package Inspector** - Checks if Python is installed, displays version information, and provides a case statement with philosophy notes about Python | `./script2.sh` |
| `script3.sh` | **Disk and Permission Auditor** - Loops through important system directories and reports disk usage, owner, and permissions for each | `./script3.sh` |
| `script4.sh` | **Log File Analyzer** - Reads a log file line by line, counts occurrences of a keyword (default: "error"), and displays the last 5 matching lines | `./script4.sh /var/log/syslog error` |
| `lib/common.sh` | **Shared helpers** - Sourced by every script; provides `print_header`, `print_separator`, `print_four_freedoms`, `print_completed`, `get_perms` | sourced, not run directly |
| `script5.sh` | **Open Source Manifesto Generator** - Interactive script that asks three questions and generates a personalized open-source philosophy statement saved to a text file | `./script5.sh` |

---

## How to Run the Scripts

### Prerequisites

- Linux operating system (Ubuntu 24.04 LTS recommended)
- Bash shell (default on most Linux systems)
- Python installed (for Script 2 verification)

### Step-by-Step Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/krishkumar1526/oss-audit-24MIM10020.git
   cd oss-audit-24MIM10020

2. **Make all scripts executable:**
   chmod +x script*.sh

3. **Run each script:**
   # Script 1 - System Identity Report
./script1.sh

# Script 2 - Package Inspector
./script2.sh

# Script 3 - Disk Auditor
./script3.sh

# Script 4 - Log Analyzer (provide a log file)
./script4.sh /var/log/syslog error

# Script 5 - Manifesto Generator (interactive)
./script5.sh

# Script 1 - System Identity Report
./script1.sh

# Script 2 - Package Inspector
./script2.sh

# Script 3 - Disk Auditor
./script3.sh

# Script 4 - Log Analyzer (provide a log file)
./script4.sh /var/log/syslog error

# Script 5 - Manifesto Generator (interactive)
./script5.sh

# Script 1 - System Identity Report
./script1.sh

# Script 2 - Package Inspector
./script2.sh

# Script 3 - Disk Auditor
./script3.sh

# Script 4 - Log Analyzer (provide a log file)
./script4.sh /var/log/syslog error

# Script 5 - Manifesto Generator (interactive)
./script5.sh


# Sample Outputs
# Script 1 - System Identity Report

=========================================
       SYSTEM IDENTITY REPORT
=========================================

Linux Distribution: Ubuntu 24.04.4 LTS
Kernel Version: 6.6.87.2-microsoft-standard-WSL2

Current User: kri_001
Home Directory: /home/kri_001

System Uptime: up 1 hour, 16 minutes
Current Date/Time: 2026-03-28 19:48:14

=========================================

The Linux operating system is covered by
the GNU General Public License (GPL v2).

=========================================


# Script 2 - FOSS Package Inspector

=========================================

     FOSS PACKAGE INSPECTOR
     
=========================================

✓ python3 is installed.

Version Information:
Python 3.12.3

Location: /usr/bin/python3

📖 About Python:
Created by Guido van Rossum in 1991
License: Python Software Foundation (PSF) License
Philosophy: Readability matters, community-driven
Used for: AI, Web, Automation, Data Science

The Four Freedoms of Free Software:
0 - Run the program for any purpose
1 - Study and modify the source code
2 - Redistribute copies
3 - Distribute modified versions


# Script 3 - Disk and Permission Auditor

=========================================

     DISK AND PERMISSION AUDITOR
     
=========================================

Directory Audit Report
----------------------
/etc → Permissions: drwxr-xr-x root root | Size: 4.3M
/var/log → Permissions: drwxrwxr-x root syslog | Size: 56M
/home → Permissions: drwxr-xr-x root root | Size: 48K
/usr/bin → Permissions: drwxr-xr-x root root | Size: 95M
/tmp → Permissions: drwxrwxrwt root root | Size: 24K

=========================================

Python Configuration Directory Check

=========================================
/etc/python3 exists - Permissions: drwxr-xr-x root root

Audit completed: Sat Mar 28 19:41:29 UTC 2026


# Script 4 - Log File Analyzer

=========================================

        LOG FILE ANALYZER
        
=========================================

Analyzing: /var/log/syslog
Searching for: 'error'

Found 'error' 10 times

Last 5 matching lines:
----------------------
2026-03-28T18:28:28.434453+00:00 KRISH wsl-pro-service[213]: WARNING Could not ensure valid Landscape configuration
2026-03-28T18:34:44.480534+00:00 KRISH systemd[1]: apport-autoreport.path was skipped
2026-03-28T18:34:44.480546+00:00 KRISH systemd[1]: apport-autoreport.timer was skipped
2026-03-28T18:34:44.482241+00:00 KRISH kernel: RAS: Correctable Errors collector initialized
2026-03-28T18:35:27.045725+00:00 KRISH kernel: WSL (246) ERROR: CheckConnection: getaddrinfo() failed: -5

Analysis completed: Sat Mar 28 19:41:46 UTC 2026


# Script 5 - Open Source Manifesto Generator

=========================================

   OPEN SOURCE MANIFESTO GENERATOR
   
=========================================

Answer three questions to create your manifesto.

1. Name one open-source tool you use every day: Python
2. In one word, what does 'freedom' mean to you? Everything
3. Name one thing you would build and share freely: AI

✓ Manifesto saved to: manifesto_kri_001_2026-03-28.txt

Preview:
--------
=========================================

     MY OPEN SOURCE MANIFESTO
     
=========================================

Created by: kri_001
Date: Sat Mar 28 19:42:15 UTC 2026

I use Python every day. It reminds me that
software can be built by anyone, for anyone.

To me, freedom means Everything.
It means having the right to study, modify,
and share code without asking permission.

I believe in building and sharing freely.
That is why I would build AI and release
it under an open-source license.

=========================================

The Four Freedoms of Free Software:
0 - Run the program for any purpose
1 - Study and modify the source code
2 - Redistribute copies
3 - Distribute modified versions

=========================================


# Dependencies
All scripts use built-in Linux commands and require no external dependencies:

Script	Commands Used
Script 1	cat, grep, cut, uname, whoami, uptime, date
Script 2	command, which, python3
Script 3	ls, du, awk, cut
Script 4	grep, tail
Script 5	read, date, cat

# Shell Scripting Concepts Demonstrated

Concept	Scripts Used
Variables	All scripts
Command Substitution $()	Scripts 1, 2, 3, 4
Conditional Statements if-then	Scripts 2, 3, 4
Case Statement	Script 2
For Loop	Script 3
While Loop with File Reading	Script 4
User Input read	Script 5
File Writing > and >>	Script 5
Exit Codes	Script 4
Comments for Documentation	All scripts

# System Requirements

Operating System: Linux (Ubuntu 22.04/24.04, Debian, or any distribution with Bash)

Bash Version: 4.0 or higher

Disk Space: Minimal (< 1 MB for scripts)

Python: 3.x (for Script 2 verification)


# Repository Structure

oss-audit-24MIM10020/
├── README.md                    # Project documentation
├── lib/common.sh                # Shared helper functions
├── script1.sh                   # System Identity Report
├── script2.sh                   # FOSS Package Inspector
├── script3.sh                   # Disk and Permission Auditor
├── script4.sh                   # Log File Analyzer
├── script5.sh                   # Open Source Manifesto Generator
└── manifesto_*.txt              # Generated output from Script 5


# License

This project is for educational purposes as part of the Open Source Software course. The scripts are provided under the MIT License for learning and modification.


# References

https://www.python.org/

https://docs.python.org/3/license.html

https://www.gnu.org/licenses/gpl-3.0.en.html

https://linuxcommand.org/

https://opensource.org/


# Acknowledgments

Guido van Rossum for creating Python and sharing it with the world

The open-source community for maintaining and improving Python for decades

Course instructors for guidance on open source philosophy


# Contact

For any questions regarding this project, please reach out through the course portal.


