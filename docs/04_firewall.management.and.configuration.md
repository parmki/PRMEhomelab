Firewall Management And Configuration With Firewalld

## Objective
Learn how to manage the firewall on the server using firewalld, understanding zones, services, and the difference between runtime and permanent rules, 
in preparation for exposing services like Apache in a later session.

## Overview
This session focused on exploring firewalld, the default firewall management tool on RHEL.
Work included checking the active zone, reviewing currently allowed services, adding new services permanently,
reloading the firewall to apply changes, and verifying SSH access remained intact throughout.

## Tasks Completed

### Firewalld Status Check
Verified that firewalld was active and enabled, then confirmed the active zone was `public`, 
bound to the network interface `enp2s0`.

### Reviewing Current Rules
Listed the existing rules for the `public` zone. 
Baseline allowed services were `cockpit`, `dhcpv6-client`, and `ssh`.

### Predefined Services
Reviewed the list of predefined services firewalld supports.
Each service definition maps to the correct port automatically, removing the need to memorize individual port numbers.

### Adding Services
Added `http` as a permanent rule and reloaded the firewall to apply it.
Repeated the same process for `https`. After each reload, 
SSH access was tested from a separate terminal session to confirm nothing was broken.

## Outcome
The firewall now allows `http` and `https` on the `public` zone. Both `http` and `https` 
were left open ahead of installing Apache in the next session, 
since no service is currently listening on those ports and there's no real exposure yet.
This sets up the server to expose Apache without needing to revisit firewall configuration.

## Linux Features Used
- `firewall-cmd`
- `systemctl`
- firewalld zones and services
- `--permanent` and `--reload`

## Lessons Learned
- Zones are named rule-sets tied to network interfaces; `public` is the default, more restrictive zone for untrusted networks.
- Rules added with `--permanent` are staged into config but don't take effect until a reload happens.
- Rules added without `--permanent` apply immediately but are lost on reboot or reload.
- Reloading applies staged changes without dropping active connections, making it safer than restarting the firewalld service.
- Always test SSH access in a separate terminal session before trusting a firewall change, to avoid getting locked out.
