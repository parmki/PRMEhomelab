## Automation Scripts & Cron Tasks

## Objective

My objective was to set up basic server automation with Bash scripts and cron. I configured automated company backups, a weekly system health report, and cleanup of old backups.

## Overview

In this session i practiced turning normal Linux commands into reusable Bash scripts and then scheduling them with cron. I also tested the scripts manually and fixed a few small path, permission, and syntax issues along the way.

## Writing the Scripts

I created three scripts under `/usr/bin`:

* `company_backup.sh` – creates a compressed backup of `/home/company`.
* `system_health.sh` – records basic server health information to a log.
* `cleanup_companybackups.sh` – removes backup files older than 60 days.

For the backup script, I created `/var/backups/company` and used `tar` with gzip compression. I tested the archive with `tar -tzf` and confirmed that the company directories and Git repositories were included.

For the health script, I created `/var/log/system-health` and used several commands to collect system information. I had a couple of small mistakes with the log path and `hostnamectl`, but corrected them and successfully generated the final health report.

The cleanup script uses `find` to locate old backup files and remove them.

## Cron Configuration

I configured root's crontab with the three automated jobs:

```cron
0 2 * * 1 /user/bin/company_backup.sh
0 18 * * 0 /usr/bin/system_health.sh
0 3 * * 0 /usr/bin/cleanup_companybackups.sh
```

The backup runs Monday at 02:00, the health report runs Sunday at 18:00, and the cleanup runs Sunday at 03:00.

## Tasks Completed

* Created the backup directory structure.
* Wrote and tested the company backup script.
* Verified the contents of the generated archive.
* Wrote and tested the system health script.
* Created a persistent system health log.
* Wrote and tested the backup cleanup script.
* Made the scripts executable.
* Configured root's crontab.
* Practiced troubleshooting paths, permissions, redirection, and script syntax.

## Outcome

I now have a working basic automation setup for the homelab. The scripts work when run manually, the health reports are being logged correctly, and the cron jobs are configured. The backup cron path just needs one final correction.

## Linux Features Used

* **Bash scripting** – wrote reusable `.sh` scripts with variables and command execution.
* **`mkdir -p`** – created the required backup and logging directories.
* **`sudo`** – performed administrative tasks under `/var`, `/usr/bin`, and root's crontab.
* **`nano`** – created and edited the scripts.
* **`chmod +x`** – made the scripts executable.
* **`tar -czf`** – created compressed `.tar.gz` backups.
* **`tar -tzf`** – checked archive contents without extracting them.
* **`date`** – generated timestamps for the backup/report process.
* **`hostnamectl`** – collected hostname and system information.
* **`uptime`** – recorded uptime and load averages.
* **`df -h`** – checked filesystem usage.
* **`free -h`** – checked RAM and swap usage.
* **`head`** – limited command output in the health report.
* **`find`** – located old backup files for cleanup.
* **`>` / `>>`** – redirected command output into the health log.
* **`crontab -e` / `crontab -l`** – configured and checked scheduled jobs.

## Lessons Learned

I learned how to combine normal Linux commands into useful administrative scripts instead of running everything manually. Testing each script before putting it into cron also showed me how important exact paths, permissions, and output redirection are.

The session also gave me more practical experience troubleshooting small mistakes and verifying that the automation actually produces the expected results.
