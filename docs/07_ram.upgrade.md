# Server RAM Upgrade 
## Objective

My objective was to upgrade the server's memory from 8GB to 16GB DDR3L by replacing the two 4GB modules with two 8GB modules.

## Overview

In this session I checked the current RAM setup, shut the server down, swapped the old modules for the new ones, and confirmed the system saw the full 16GB afterward.

## Checking the Current Setup

First I checked what was installed so I bought the right replacement. I ran `free -h` and `dmidecode -t memory`, which showed two 4GB DDR3L modules. I confirmed the max supported capacity in the server docs so 16GB would work.

## The Upgrade

I shut the server down with `sudo shutdown now`, unplugged it, opened the case, and removed the two 4GB sticks. Then I installed the new 8GB modules, pushed them down until the clips clicked, closed the case, and powered it back on.

## Verifying

After booting I checked that everything was detected:

- `free -h` – showed 16GB total.
- `dmidecode -t memory` – listed both new 8GB modules.

Both modules were recognized with no issues.

## Tasks Completed

- Checked current RAM with `free -h` and `dmidecode`.
- Confirmed 16GB was supported.
- Shut down the server and swapped the modules.
- Booted up and verified 16GB was detected.

## Outcome

The server now has 16GB of RAM, up from 8GB. The system booted normally and detected both new modules without any problems. The old 4GB sticks were kept as spares.

## Linux Features Used

- `free -h` – checked total RAM.
- `dmidecode -t memory` – viewed installed module details.
- `sudo shutdown` – powered off the server.

## Lessons Learned

I learned to always check what's actually installed before buying RAM, since the module type, voltage, and max supported capacity all matter. It was also a good reminder of how quick it is to verify a hardware change with `free` and `dmidecode` afterward.
