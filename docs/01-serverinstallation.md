# Server Installation, Configuration and Remote Administration

## Objective

My goal was to install and configure the server for reliable network connectivity and enable remote administration over SSH and Cockpit, allowing the system to work without a dedicated monitor, keyboard, or mouse.

## Environment

* **Server:** Dell OptiPlex 3040 SFF running Red Hat Enterprise Linux 10.2
* **Installation:** RHEL 10 Server (minimal installation without a GUI)
* **Administration Workstations:** RHEL laptop and Fedora desktop
* **Network:** Local Ethernet network

## Installation

The server was installed using the Red Hat installer from a bootable USB drive. I chose the minimal installation without a graphical user interface because it more closely reflects how production Linux servers are typically managed. It also encourages learning to troubleshoot and administer the system entirely from the command line while reducing resource usage.

## Network Configuration

The initial plan was to use a USB Wi-Fi adapter to provide temporary network connectivity. Due to driver compatibility issues ethernet was selected as the primary network connection. This approach also better reflects a typical server deployment.

Initially, the Ethernet interface appeared as disconnected despite the physical link being active. To diagnose the issue, I inspected the network interfaces using `ip` and `nmcli`, verified the routing table, and confirmed that the network adapter was detected by the operating system. Once the issue was identified as an inactive NetworkManager connection rather than a hardware fault, I activated the interface through NetworkManager and verified that the server obtained a valid IP address and could communicate with other devices on the local network.

After confirming the physical network link, I activated the Ethernet interface using NetworkManager. Network connectivity was then verified by inspecting the network interfaces, routing table, and testing communication with other devices on the local network.

## Remote Administration

The OpenSSH server was verified to be installed, running, and configured to start automatically during system boot. The listening service and firewall configuration were inspected to ensure SSH access was permitted on the active network interface.

To validate the SSH configuration, I checked the SSH service status with `systemctl`, confirmed that the daemon was listening on TCP port 22 using `ss`, and verified the firewall configuration with `firewall-cmd`. Initial connection attempts were unsuccessful, so I used additional network diagnostics, including `ping`, `nc`, and `tcpdump`, to isolate the issue. This process confirmed that the SSH service was functioning correctly and ultimately revealed that the incorrect IP address had been used during the connection attempt. After correcting the destination address, SSH connectivity was successfully established.

Connectivity testing confirmed that the server was reachable from both the RHEL laptop and Fedora desktop over the local network. Remote administration was successfully established using SSH, and Cockpit was configured as an additional web-based management interface.

## Outcome

The server now operates as a headless RHEL 10 system. Day-to-day administration can be performed remotely using SSH or Cockpit, eliminating the need for a permanently attached monitor, keyboard, or mouse.

This configuration establishes the foundation for future work, including user and group management, storage administration, security hardening, service deployment, self-hosting services, and automation.
