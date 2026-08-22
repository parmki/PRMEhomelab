# 03 – Git Setup and Company Development Workspace

## Objective

Prepare the server for future development work by installing Git, organizing project directories, and making a few system configuration improvements.

---

## Overview

This session focused on setting up Git for local version control, organizing the company workspace into project directories, and making a few general system improvements. The system packages were updated, the server hostname was changed using Cockpit, and a custom login banner was added for SSH sessions.

---

## Tasks Completed

### System Updates

Updated all installed system packages using DNF to ensure the server was running the latest available versions.

### Git Installation

Installed Git, verified the installation, and configured the global Git username and email.

### Company Project Structure

Expanded the company workspace with project directories for different teams.

```text
/home/company
├── developers
│   ├── backend
│   └── frontend
├── hr
    └── cases
    |__ general
```

Initialized each project directory as a local Git repository using `git init`.

### Hostname and MOTD

Changed the system hostname using Cockpit and verified the change with `hostnamectl`.

Configured a custom Message of the Day (MOTD) by editing `/etc/motd`.

### Minor Issue

While testing access, I realized my user account needed to be added to the appropriate groups to access the new project directories. After updating my group memberships, access worked as expected.

---

## Outcome

The server now has Git installed, a more organized project structure, an updated hostname, and a custom login message. These changes provide a better foundation for future development and administration tasks.

---

## Linux Features Used

* `dnf`
* `git`
* `git init`
* `git config`
* `mkdir`
* `hostnamectl`
* Cockpit
* `/etc/motd`
* `usermod`

---

## Lessons Learned

* Local Git repositories are useful even before connecting to GitHub.
* Updating packages regularly helps keep the system current.
* If group memberships change, users may need to log out and back in before the changes take effect.
* Cockpit is a convenient way to perform common administrative tasks while still verifying changes from the command line.
